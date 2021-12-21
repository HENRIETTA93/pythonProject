#include <stdio.h>

int main()
{
    int stu=6;
    int cur=5;
    float scores[stu][cur];
    int i=0;
    for(;i<stu;i++){
        printf("please input student %d's scores\n",i+1);
        for(int j=1;j<=cur;j++){
            printf("please input student %d's score %d\n",i+1,j);
            scanf("%f",&scores[i][j-1]);
        }
    }

    int j=1;
    int fail=0;
    for(j=1;j<=cur;j++){
        i=1;
        fail=0;
        for (i=1;i<=stu;i++){
            if(scores[i-1][j-1]<60){
                fail+=1;
            }
        }
        printf("course %d failed percent %.2f\n",j,(float)fail/stu*100);
    }

    return 0;
    
}