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

    i=0;
    int j=0;
    int k=0;
    float temp;
    for (j=0;j<cur;j++){
        for(i=0;i<stu;i++){
            for(k=0;k<stu-i;k++){
                if(scores[k][j]<scores[k+1][j]){
                    temp=scores[k][j];
                    scores[k][j]=scores[k+1][j];
                    scores[k+1][j]=temp;
                }
            }
        }
    }

    j=0;
    i=0;
    int number=1;
    for(j=0;j<cur;j++){
        number=1;
        printf("course %d's scores:\n",j+1);
        for(i=0;i<stu;i++){
            printf(" %d place score %f\n",number,scores[i][j]);
            number++;
        }
        
    }


    return 0;
    
}