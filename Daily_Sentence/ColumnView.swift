import SwiftUI

struct ColumnView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("一日一文の意味")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            Text("一日一文を書くことで、日々の振り返りを行い、自分の思考や感情を整理する習慣を身につけます。また、継続的に文章を書くことで、自己表現力や思考力が向上します。")
                .padding()
                .font(.body)
                .multilineTextAlignment(.leading)
        }
        .padding()
    }
}

struct ColumnView_Previews: PreviewProvider {
    static var previews: some View {
        ColumnView()
    }
}
