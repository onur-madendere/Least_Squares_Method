flag0=0;
x=input("x ekseni uzerindeki noktalari vektor olarak girin: ");
y=input("y ekseni uzerindeki degerleri vektor olarak girin: ");

if sum(x==0)+sum(y==0)>0
    fprintf("Datada 0 var. Uydurmak istediginiz egriyi dikkatle secin. \n");
end


if size(x)==size(y)
    flag0=1;
end
 
if flag0==1
    p=input('2 parametreli egri icin 2, 2+ parametreli egri icin 3 girin: ');
    
    switch p
        case 2
            a=0;
            b=0;
            Sol=[a,b]';
            q=input("Uydurmak istediginiz egriyi secin: \n" + ...
                "f(x)=ax^m+bx^n icin 1\n" + ...
                "f(x)=ae^(bx) icin 2\n" + ...
                "f(x)=axe^(bx) icin 3\n" + ...
                "f(x)=ax^b icin 4\n ");
           
            switch q
                case 1

                    M=input("m ve n degerini vektor olarak girin: ");
                    m=M(1); n=M(2);
                    A=[sum(x.^(2*m)), sum(x.^(m+n)); sum(x.^(m+n)),sum(x.^(2*n))];
                    B=[sum(y.*x.^m);sum(y.*x.^n)];

                    Sol=A\B;
                    f=@(t) Sol(1).*t.^m+Sol(2).*t.^n;
       

                case 2
                    y=log(y);
                    Y=sum(y)/length(y);
                    X=sum(x)/length(x);

                    b=sum(y.*(x-X))/sum(x.*(x-X));
                    a=exp(Y-b*X);

                    f=@(t) a.*exp(b*t);

                case 3                   
                    y=log(y./x);
                    Y=sum(y)/length(y);
                    X=sum(x)/length(x);

                    b=sum(y.*(x-X))/sum(x.*(x-X));
                    a=exp(Y-b*X);

                    f=@(t) a.*t.exp(b*t);

                case 4
                    y=log(y);
                    x=log(x);
                    Y=sum(y)/length(y);
                    X=sum(x)/length(x);

                    b=sum(y.*(x-X))/sum(x.*(x-X));
                    a=exp(Y-b*X);
                    
                    f=@(t) a*t.*exp(b*t);


                otherwise
                    fprintf("Sayi tanim kumesinin disinda.\n");
            
            end

    
        case 3
            k=input("f(x)=a0+a1x+...+akx^k egrisi icin k girin: ");

            A=zeros(k+1,k+1);
            for i=1:k+1
                for j=1:k+1
                    A(i,j)=sum(x.^(i+j-2));
                end
            end

            B=zeros(k+1,1);
            for i=1:k+1
                B(i,1)=sum(y.*x.^(i-1));
            end

            Sol=A\B;

            f=@(t) t.^(0:k)*Sol;

    
        otherwise
            fprintf("Sayi tanim kumesinin disinda. \n")
    
    end

else
    fprintf("Vektorlerin boyutlarini uyumlu degil.");
end
