
import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
   /* @StateObject var viewModel= ToDoListViewViewModel()
    when you need to pass parameters to the view model or perform additional setup in the init method
    @StateObject var viewModel: ToDoListViewViewModel
    when the view model can be initialized directly without additional parameters or setup.
    */
    
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    init(userId:String){
        //Get task data from the path : users/<id>/todos/<entries>
        // _ :Tell the app that where to look for your tasks.
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/todos")
        //initialize the @StateObject with custom parameters
        self._viewModel = StateObject(
            wrappedValue: ToDoListViewViewModel(userId: userId))
        
    }
    
    var body: some View {
        NavigationView{
            VStack{
                List(items) { item in
                    // a new ToDoListItemView is created and initialized with that item
                    ToDoListItemView(item: item)
                        .swipeActions{
                            Button("Delete"){
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
                
            }
            .navigationTitle("To do list")
            .toolbar{
                Button{
                    //action
                    viewModel.showingNewItemView = true
                } label:{
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView){
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

#Preview {
    ToDoListView(userId: "mkytUKvy0dNh9XTZ82a36cYHz8H2")
}
