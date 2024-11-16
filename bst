#include<iostream>
using namespace std;
class node
{
    public:
    int data;
    node* left;
    node* right;
    node(int value)
    {
        data=value;
        left=nullptr;
        right=nullptr;
    }

};
node* create_bst(node* root,int value)
{
    if(root==nullptr)
    {
        node* temp=new node(value);
        return temp;
    }
    if(root->data>value)
    {
        root->left=create_bst(root->left,value);
    }
    else{
        root->right=create_bst(root->right,value);
    }
    return root;

}
void inorder(node* root)
{
    if(root==nullptr)
    {
        return;
    }
    inorder(root->left);
    cout<<root->data<<" ";
    inorder(root->right);
}
node* insert( node* root,int key)
{
    if(root==nullptr)
    {
        node* temp=new node(key);
        return temp;
    }
    if(root->data>key)
    {
        root->left=insert(root->left,key);
    }
    else{
        root->right=insert(root->right,key);
    }
    return root;
}
bool search(node* root,int value)
{
    if(root==nullptr)
    return 0;
    if(root->data==value) return 1;
    if(root->data>value)
    {
        return search(root->left,value);
    }
    else
    {
        return search(root->right,value);

    }
   
}
node* delete_node( node* root,int target)
{
    if(root==nullptr)
    {
        return nullptr;
    }
    if(root->data>target)
    {
        root->left=delete_node(root->left,target);
    }
    else if(root->data<target)
    {
        root->right=delete_node(root->right,target);
    }
    else{
        if(root->left==nullptr&&root->right==nullptr)
        {
            delete root;
            return nullptr;
        }
        else if(root->right==nullptr&&root->left!=nullptr)
        {
            node* temp=root->left;
            delete root;
            return temp;
        }
        else if(root->left==nullptr&&root->right!=nullptr)
        {
            node* temp=root->right;
            delete root;
            return temp;

        }
        else{
            node* child=root->left;
            node* parent=root;
            while(child->right)
            {
                parent=child;
                child=child->right;
            }
            if(root!=parent)
            {
                parent->right=child->left;
                child->left=root->left;
                child->right=root->right;
                delete root;
                return child;
            }
            else{
                child->right=root->right;
                delete root;
                return child;
            }
        }
    }
    return root;
}

int main()
{
    int arr[8]={8,4,3,6,11,13,12,5};
    node* root=nullptr;
    for(int i=0;i<8;i++)
    {
        root=create_bst(root,arr[i]);
    }
    inorder(root);
    int key;
    cout<<"enter value to insert into the bst";
    cin>>key;
    root=insert(root,key);
    inorder(root);
    int search_key;
    cout<<"enter the key to be searched";
    cin>>search_key;
 bool c=search(root,search_key);
    if(c)
    {
          cout<<"search_key is present";
    }
    else{
        cout<<"search_key is not present";
    }
    cout<<endl;
    int delete_key;
    cout<<"enter the value to be deleted from bst";
    cin>>delete_key;
    root=delete_node(root,delete_key);
    inorder(root);

    return 0;

}
