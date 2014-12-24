% CSE 18.085 HW 1.1
% Chad Arnett
% 12/24/14

%% 1.1.2. Compute inv(T)_3 in three steps, using U and inv(U) in equation (2)
disp('1.1.2')
U = eye(3) + diag([-1 -1],1);
U(1,1) = 1;
U

%1 Check that T_3 = U'U
disp('1.1.2.1')
    T_3 = U'*U
%2 Check that U * inv(U) = I when 1's on and above the main diagonal
disp('1.1.2.2')
    I = U*inv(U)
%3 Invert U'U so to find T_3 Inverse = inv(U) * inv(U)' [inverses come in
% reverse order!]
disp('1.1.2.3')
    invT = inv(U) * inv(U)'
    
%% 1.1.5.   The inverses of K3 and K4 have fractions 1/det = 1/4, 1/4:
invK3 = 1/4*[3 2 1; 2 4 2; 1 2 3]
invK4 = 1/4*[4 3 2 1; 3 6 4 2; 2 4 6 3; 1 2 3 4]
% Guess the determinant of K = K5
% guess:  det(K5) = 6
%
% compute det(K) and inv(K) and det(K)*inv(K)
K5 = toeplitz([2 -1 zeros(1,3)])

detK5 = det(K5)

invK5 = inv(K5)

detinvK5 = detK5*invK5


%% 1.1.20 The four ways to find AB give numbers, columns, rows, and matrices
%   1 (rows of A) times (columns of B)  C(i,j) = A(i,:)*B(:,j)
%   2 A times (columns of B)            C(:j)  = A*B(:,j)
%   3 (rows of A times B                C(i,:) = A(i,:)*B
%   4 (columns of A) times (rows of B)  for k = i:n, C = C+A(:,k)*B(k,:);
%                                       end

% Finish these 8 multiplications for columns times rows 
A = [2 3; 4 5]
B = [1 2; 2 4]
n = 2;
C = zeros(n);
for k = 1:n
    C = C + A(:,k)*B(k,:);
end
C

% For n x n matrices A and B, column x row product requires n^3 individual
% multiplications

%% 1.1.22.  Use n = 1000; e = ones(n,1); K = spdiags([-e,2*e,-e],-1:1,n,n);
% to enter a sparse matrix.  
n = 1000;
e = ones(n,1);
K = spdiags([-e, 2*e, -e],-1:1,n,n);

% Solve the sparse equation Ku = e by u = K\e.
u = K\e;
% Plot the solution by plot(u)
plot(u) % spoiler alert: plot is -(x-500)^2 + 1.2525e5
grid on


