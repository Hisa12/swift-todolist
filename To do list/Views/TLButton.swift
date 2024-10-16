
import SwiftUI

struct TLButton: View {
    let title:String
    let background:Color
    //Let 'action' know do this action
    let action: () -> Void
    
    var body: some View {

        Button(title){
            action()
        }
        .foregroundColor(.white)
        .frame(width:300, height:50)
        .background(background)
        .cornerRadius(10)
        .padding()
    }
}

#Preview {
    TLButton(title: "Value", background:.pink){
        //Action
    }
}
