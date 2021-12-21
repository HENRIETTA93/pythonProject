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

    i=1;
    int j=1;
    float avgScores[stu][1];
    for(i=1;i<=stu;i++){
        float sum=0;
        j=1;
        for(j=1;j<=cur;j++){
            sum+=scores[i-1][j-1];
        }
        avgScores[i-1][0]=sum/(float)cur;
    }
    for(i=1;i<=stu;i++){
        printf("student %d's avg score is %f\n",i,avgScores[i-1][0]);
    }

    return 0;
    
}