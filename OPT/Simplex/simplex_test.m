clc
clear all
close all
a = 1;
X(1,:) = [4.0 4.0];
X(2,:) = [4.0 4.0] + a * [1 0];
X(3,:) = [4.0 4.0] + a * [0 1];
%  Define algorithm constants
%
  rho = 1;    % rho > 0
  Xi  = 2;    % Xi  > maX(rho, 1)
  gam = 0.5;  % 0 < gam < 1
  sig = 0.5;  % 0 < sig < 1
  
  tolerance = 1.0E-05;
  maX_feval = 200;
%
%  Initialization
%
  [ temp, n_dim ] = size ( X );

  if ( temp ~= n_dim + 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'NELDER_MEAD - Fatal error!\n' );
    error('  Number of points must be = number of design variables + 1\n');
  end

levels = linspace(0,18,30).^2-1.5;
  if ( flag )
    Xp = linspace(-8,8,1001);
    YP = Xp;
    for i=1:length(Xp)
      for j=1:length(YP)  
        fp(j,i) = feval(ObjFunc,[Xp(i),YP(j)]);
      end
    end
    
    figure ( 27 )
    hold on
    contour(Xp,YP,fp,levels)
    
    if ( flag )
      plot(X(1:2,1),X(1:2,2),'r')
      plot(X(2:3,1),X(2:3,2),'r')
      plot(X([1 3],1),X([1 3],2),'r')
      pause
      plot(X(1:2,1),X(1:2,2),'b')
      plot(X(2:3,1),X(2:3,2),'b')
      plot(X([1 3],1),X([1 3],2),'b')
    end

  end

  indeX = 1 : n_dim + 1;

  [f    ] = ObjFunc(X); 
  n_feval = n_dim + 1;

  [ f, indeX ] = sort ( f );
  X = X(indeX,:);
%  
%  Begin the Nelder Mead iteration.
%
  converged = 0;
  diverged  = 0;
  
  while ( ~converged && ~diverged )
%    
%  Compute the midpoint of the simpleX opposite the worst point.
%
    X_bar = sum ( X(1:n_dim,:) ) / n_dim;
%
%  Compute the reflection point.
%
    Xr   = ( 1 + rho ) * X_bar ...
                - rho   * X(n_dim+1,:);

    f_r   = feval(ObjFunc,Xr); 
    n_feval = n_feval + 1;
%
%  Accept the point:
%    
    if ( f(1) <= f_r && f_r <= f(n_dim) )

      X(n_dim+1,:) = Xr;
      f(n_dim+1  ) = f_r; 
       
      if (flag)
        title('reflection')
      end
%
%  Test for possible eXpansion.
%
    elseif ( f_r < f(1) )

      X_e = ( 1 + rho * Xi ) * X_bar ...
                - rho * Xi   * X(n_dim+1,:);

      f_e = feval(ObjFunc,X_e); 
      n_feval = n_feval+1;
%
%  Can we accept the eXpanded point?
%
      if ( f_e < f_r )
        X(n_dim+1,:) = X_e;
        f(n_dim+1  ) = f_e;
        if (flag), title('eXpansion'), end
      else
        X(n_dim+1,:) = Xr;
        f(n_dim+1  ) = f_r;
        if (flag), title('eventual reflection'), end
      end
%
%  Outside contraction.
%
    elseif ( f(n_dim) <= f_r && f_r < f(n_dim+1) )

      X_c = (1+rho*gam)*X_bar - rho*gam*X(n_dim+1,:);
      f_c = feval(ObjFunc,X_c); n_feval = n_feval+1;
      
      if (f_c <= f_r) % accept the contracted point
        X(n_dim+1,:) = X_c;
        f(n_dim+1  ) = f_c;
        if (flag), title('outside contraction'), end
      else
        [X,f] = shrink(X,ObjFunc,sig); n_feval = n_feval+n_dim;
        if (flag), title('shrink'), end
      end
%
%  F_R must be >= F(N_DIM+1).
%  Try an inside contraction.
%
    else

      X_c = ( 1 - gam ) * X_bar ...
                + gam   * X(n_dim+1,:);

      f_c = feval(ObjFunc,X_c); 
      n_feval = n_feval+1;
%
%  Can we accept the contracted point?
%
      if (f_c < f(n_dim+1))
        X(n_dim+1,:) = X_c;
        f(n_dim+1  ) = f_c;
        if (flag), title('inside contraction'), end
      else
        [X,f] = shrink(X,ObjFunc,sig); n_feval = n_feval+n_dim;
        if (flag), title('shrink'), end
      end

    end
%
%  Resort the points.  Note that we are not implementing the usual
%  Nelder-Mead tie-breaking rules  (when f(1) = f(2) or f(n_dim) =
%  f(n_dim+1)...
%
    [ f, indeX ] = sort ( f );
    X = X(indeX,:);
%
%  Test for convergence
%
    converged = f(n_dim+1)-f(1) < tolerance;
%   
%  Test for divergence
%
    diverged = ( maX_feval < n_feval );
    
    if (flag)
      plot(X(1:2,1),X(1:2,2),'r')
      plot(X(2:3,1),X(2:3,2),'r')
      plot(X([1 3],1),X([1 3],2),'r')
      pause
      plot(X(1:2,1),X(1:2,2),'b')
      plot(X(2:3,1),X(2:3,2),'b')
      plot(X([1 3],1),X([1 3],2),'b')
    end

  end

  if ( 0 )
    fprintf('The best point X^* was: %d %d\n',X(1,:));
    fprintf('f(X^*) = %d\n',f(1));
  end

  X_opt = X(1,:);
  
  if ( diverged )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'NELDER_MEAD - Warning!\n' );
    fprintf ( 1, '  The maXimum number of function evaluations was eXceeded\n')
    fprintf ( 1, '  without convergence being achieved.\n' );
  end

  return

function f = evaluate ( X, ObjFunc )

%*****************************************************************************80
%
%% EVALUATE handles the evaluation of the function at each point.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 January 2009
%
%  Author:
%
%    Jeff Borggaard
%
%  Reference:
%
%    John Nelder, Roger Mead,
%    A simpleX method for function minimization,
%    Computer Journal,
%    Volume 7, Number 4, January 1965, pages 308-313.
%
%  Parameters:
%
%    Input, real X(N_DIM+1,N_DIM), the points.
%
%    Input, real ObjFunc ( X ), the handle of a MATLAB procedure
%    to evaluate the function.
%
%    Output, real F(1,NDIM+1), the value of the function at each point.
%
  [ temp, n_dim ] = size ( X );

  f = zeros ( 1, n_dim+1 );
  
  for i = 1 : n_dim + 1
    f(i) = feval(ObjFunc,X(i,:));
  end

  return
end
