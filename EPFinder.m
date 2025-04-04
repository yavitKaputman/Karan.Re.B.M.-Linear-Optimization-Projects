A = input("Please Enter Matrix A: ");
b = input("Please Enter Matrix b: ");
EnequalityType = input("Please Determine The Type Of Your Enequality by entreing 1 for > or 2 for <: ");
t1 = tic;
temp01 = size(A);
n = temp01(1,2);
m = temp01(1,1);
indexSet = [1:1:m];
variationMatrix = nchoosek(indexSet,n);
temp02 = size(variationMatrix);
variationNumber = temp02(1,1);
EPMatrix = [];
for i = 1:variationNumber
    B = [];
    c = [];
    for j = variationMatrix(i,:)
        B = [B ; A(j,:)];
        c = [c ; b(j,1)];
    end
    if det(B)~=0
        x = linsolve(B,c);
        ConditionType = [EnequalityType];
        if A*x >= b
            ConditionType = [ConditionType 1];
        elseif A*x <= b
            ConditionType = [ConditionType 2];
        end
        if isequal(ConditionType,[1,1])
            EPMatrix = [EPMatrix x];
        elseif isequal(ConditionType,[2,2])
            EPMatrix = [EPMatrix x];
        end
    end
end
if isequal(EPMatrix, [])
    disp("There are No Extreme Points!")
else
    EPMatrix = unique(EPMatrix.', 'rows').';
    temp03 = size(EPMatrix);
    EPNumber = temp03(1,2);
    AnswerBoard = [];
    for i = 1:EPNumber
        AnswerBoard = [AnswerBoard "x"+i];
    end
    disp([AnswerBoard;EPMatrix])
end
t2 = toc(t1);
disp("Computing The Problem with " + n + " Dimension and " + m + " Constraints takes " + t2 + " seconds!")