#include <stdio.h>

int findRemain(int n, int k)
{
    int arr[10000];

    int i=0;
    for(i=0;i<n;i++){
        arr[i]=i+1;
    }

    i=0;
    int total=n;
    int countk=0;
    while (n>1){
        if(i==total){
            i=0;
        }

        if (arr[i]!=0){
            countk++;
        }
        if(countk==k){
            arr[i]=0; //报数到k的人赋值为0
            countk=0;
            n-=1;  //人数减1
        }
        i++;

    }
    i=0;
    for(i=0;i<total;i++){
        if(arr[i]!=0)
        {
            return arr[i];
        }
    }
    return 0;
}
int main()
{
    int n;
    int m;
    printf("please input n:\n");
    scanf("%d",&n);
    printf("please input m:\n");
    scanf("%d",&m);

    int remain=findRemain(n,m);
    printf("remain is %d\n",remain);
    return 0;

}
/*
有n个人围成一圈，顺序排号。从第一个人开始报数（从1到k报数），凡报到k的人退出圈子，问最后留下的是原来第几号的那位。
编写函数实现以上功能，主函数输入n，m调用该函数完成。
*/