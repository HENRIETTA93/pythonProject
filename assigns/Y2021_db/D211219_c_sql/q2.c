#include <stdio.h>
int main()
{
    int n;
    printf("Please input n:\n");
    scanf("%d",&n);


    int i=1;
    int w=n;
    int j=1;
    int r=0;
    int m=0;
    for(i=1;i<=n;i++){
        for(w=n;w>i;w--){
            printf(" ");
        }
        for(j=1;j<=2*i-1;j++){
            r=j;
            if(r<=i){
                printf("%d",r++);
                m=r-1;

            }else{
                printf("%d",--m);
            }
            
        }
        printf("\n");
    }

    for(i=n-1;i>=1;i--){
        for(w=n;w>i;w--){
            printf(" ");
        }
        for(j=1;j<=2*i-1;j++){
            r=j;
            if(r<=i){
                printf("%d",r++);
                m=r-1;

            }else{
                printf("%d",--m);
            }
            
        }
        printf("\n");
    }
 
    return 0;
}