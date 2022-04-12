#include <stdio.h>
#include <stdlib.h>
struct elementOfTheList
{
    int x;
    struct elementOfTheList* next;
};
struct list
{
    int length;
    struct elementOfTheList* root;
};

struct list createList()
{
    struct elementOfTheList* root = malloc(sizeof(struct elementOfTheList));
    struct elementOfTheList* previous = root;
    int num,counter = 1;
    printf("Enter values of the list:\n");
    scanf("%d", &num);
    root->x = num;
    struct list l;
    l.root = root;
    l.length = counter;   
    if (num == 0)
        return l;

    scanf("%d", &num);
    while (num != 0)
    {
        struct elementOfTheList* next = malloc(sizeof(struct elementOfTheList));
        next->x = num;
        previous->next = next;
        previous = next;
        counter++;
        scanf("%d", &num);
    }
    previous->next = NULL;

    l.length = counter;

    return l;

}
void reverse(struct list l)
{
    struct elementOfTheList* root = l.root;
    struct elementOfTheList* temp = root;
    int N = l.length;
    int aux[l.length];  
    for (int i = 0; i < l.length; i++)
    {
        aux[i] = temp->x;
        temp = temp->next;
    }
    temp = root;
    for (int i = N-1; i > -1; i--)
    {
        temp->x = aux[i];
        temp = temp->next;
    }
    

}

void delete(struct elementOfTheList* root)
{
    struct elementOfTheList* temp;
    while (root->next != NULL)
    {
        temp = root;
        root = root->next;
        free(temp);
    }
    free(root);
}
void print(struct list l )
{
    struct elementOfTheList* temp = l.root;
    for (int i = 0; i < l.length; i++ )
    {
        printf("%d ", temp->x);
        temp = temp->next;
    }
    printf("\n");
}
int main()
{
    struct list li = createList();
    printf("\nInitial list: ");
    print(li);
    reverse(li);
    printf("\nReversed list: ");
    print(li);
    delete(li.root);
    return 0;
}
