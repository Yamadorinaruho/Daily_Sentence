import SwiftUI

// HomeViewは、"今日の一文"を表示・入力するためのビューです。
struct HomeView: View {
    // ユーザーが入力するテキスト
    @State private var text: String = ""
    // 前回の保存日付
    @State private var savedDate: Date? = UserDefaults.standard.object(forKey: "savedDate") as? Date
    // 保存されたテキスト
    @State private var savedText: String? = UserDefaults.standard.string(forKey: "savedText")
    // ステータスメッセージ
    @State private var statusMessage: String = ""
    
    var body: some View {
        // UI要素を垂直方向に配置するコンテナ
        VStack(spacing: 10) {
            // "今日の一文"というタイトルを表示するテキスト
            Text("今日の一文")
                .font(.largeTitle) // フォントサイズを大きくする
                .fontWeight(.bold) // フォントの太さを太くする
                .padding()
                
                 // 上下左右に余白を追加
            
            // テキスト入力エリア
            TextEditor(text: $text)
                .padding() // テキストエディタ内部に余白を追加
                .border(Color.gray, width: 1) // 灰色の枠線を追加
                .disabled(isTodaySaved()) // すでに保存されている場合、編集不可にする
                .frame(height: 30) // 高さを200に設定
            
            // "保存"ボタン
            Button(action: {
                saveText() // ボタンが押されたときにテキストを保存する
            }) {
                Text("保存")
                    .padding() // ボタン内部に余白を追加
                    .background(Color.blue) // ボタンの背景色を青にする
                    .foregroundColor(.white) // テキストの色を白にする
                    .cornerRadius(10) // ボタンの角を丸くする
            }
            .disabled(isTodaySaved()) // すでに保存されている場合、ボタンを無効にする
            
            // ステータスメッセージを表示するテキスト
            Text(statusMessage)
                .padding() // 上下左右に余白を追加
                .foregroundColor(.red) // テキストの色を赤にする
        }
        .padding() // VStack全体に余白を追加
        .onAppear {
            checkIfTodaySaved() // ビューが表示されたときに保存済みかどうかを確認する
        }
    }
    
    // すでに今日のテキストが保存されているかどうかをチェックする関数
    private func isTodaySaved() -> Bool {
        if let savedDate = savedDate {
            return Calendar.current.isDateInToday(savedDate)
        }
        return false
    }
    
    // テキストを保存する関数
    private func saveText() {
        UserDefaults.standard.set(text, forKey: "savedText") // テキストをUserDefaultsに保存
        let currentDate = Date()
        UserDefaults.standard.set(currentDate, forKey: "savedDate") // 現在の日付をUserDefaultsに保存
        savedDate = currentDate
        statusMessage = "文章が保存されました。" // ステータスメッセージを更新
    }
    
    // ビューが表示されたときに保存済みかどうかを確認する関数
    private func checkIfTodaySaved() {
        if isTodaySaved(), let savedText = savedText {
            text = savedText
            statusMessage = "今日の文章はすでに保存されています。" // すでに保存されている場合のメッセージ
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
