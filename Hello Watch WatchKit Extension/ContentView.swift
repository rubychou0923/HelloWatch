//
//  ContentView.swift
//  Hello Watch WatchKit Extension
//
//  Created by RubyChou on 2023/5/6.
//

import SwiftUI
import UserNotifications

let gold_words :[String] =
[
    "箴言 4:18 你要保守你心，勝過保守一切，因為一生的果效是由心發出。",
    "腓立比書 4:6-7  應當一無掛慮，只要凡事藉着禱告、祈求，和感謝，將你們所要的告訴神。 神所賜、出人意外的平安必在基督耶穌裏保守你們的心懷意念。",
    "馬太福音 11:28-30 凡勞苦擔重擔的人可以到我這裏來，我就使你們得安息。 我心裏柔和謙卑，你們當負我的軛，學我的樣式；這樣，你們心裏就必得享安息。 因為我的軛是容易的，我的擔子是輕省的。」",
    "馬太福音 7:7-8 你們祈求，就給你們；尋找，就尋見；叩門，就給你們開門。 8因為凡祈求的，就得着；尋找的，就尋見；叩門的，就給他開門。",
    "提摩太後書 1:6-7 為此我提醒你，使你將神藉我按手所給你的恩賜再如火挑旺起來,因為神賜給我們，不是膽怯的心，乃是剛強、仁愛、謹守的心。",
    "以賽亞書 40:31 但那等候耶和華的，必重新得力。他們必如鷹展翅上騰，他們奔跑卻不困倦，行走卻不疲乏。",
    "詩篇 46:10 你們要休息，要知道我是神！我必在外邦中被尊崇，在遍地上也被尊崇。",
    "詩篇 100:3 你們當曉得耶和華是神，我們是他造的，也是屬他的，我們是他的民，也是他草場的羊",
    "以賽亞書 2:17 驕傲的必屈膝，狂妄的必降卑，在那日，唯獨耶和華被尊崇。",
    "申命記 31:6 你們當剛強壯膽，不要害怕，也不要畏懼他們，因為耶和華你的神和你同去。他必不撇下你，也不丟棄你。",
    "哥林多後書 12:10 我為基督的緣故，就以軟弱、凌辱、急難、逼迫、困苦為可喜樂的；因我什麼時候軟弱，什麼時候就剛強了。",
    "以弗所書 3:17-18 使基督因你們的信住在你們心裡，叫你們的愛心有根有基， 能以和眾聖徒一同明白基督的愛是何等長闊高深",
    "出埃及記 20:1-3 神吩咐這一切的話說： 我是耶和華你的神，曾將你從埃及地為奴之家領出來。除了我以外，你不可有別的神",
    "腓立比書 4:4-7 你們要靠著主常常喜樂，我再說，你們要喜樂。要使大家看出你們謙和的心。主已經近了。應當毫無憂慮，只要凡事藉著禱告祈求，帶著感恩的心，把你們所要的告訴神。這樣，　神所賜超過人能了解的平安，必在基督耶穌裡，保守你們的心思意念。",
    "哥林多後書 5:17-18 所以，若有人在基督裏，他就是新造的人：舊事已過，都變成新的了。 一切都是出於上帝；他藉著基督使我們與他和好，又將勸人與他和好的使命賜給我們。",
    "以賽亞書 54:10 雖然大山可以挪開，小山可以遷移， 但我的慈愛必不從你身上挪開， 我和平的約也必不遷移； 這是憐憫你的耶和華說的。",
    "詩篇 16:11 你必把生命的路指示我， 在你面前有滿足的喜樂， 在你的右手中有永遠的福樂。",
    "加拉太書 5:22-23 聖靈的果子就是仁愛、喜樂、和平、忍耐、恩慈、良善、信實、 溫柔、節制。這樣的事沒有律法禁止",
    "加拉太書 5:19-21 情慾的事都是顯而易見的；就如淫亂、污穢、放蕩、 拜偶像、行邪術、仇恨、紛爭、忌恨、憤怒、自私、分派、結黨、 嫉妒、醉酒、荒宴等類。我從前告訴過你們，現在又告訴你們，做這樣事的人必不能承受上帝的國。",
    "腓立比書 2:3-4 凡事不可結黨，不可貪圖虛浮的榮耀；只要存心謙卑，各人看別人比自己強。 各人不要單顧自己的事，也要顧別人的事。",
    "路加福音 14:28 你們哪一個要蓋一座樓，不先坐下算計花費，能蓋成不能呢？",
    "箴言 15:22 不先商議，所謀無效； 謀士眾多，所謀乃成。",
    "詩篇 103:8-10 耶和華有憐憫，有恩典， 不輕易發怒，且有豐盛的慈愛。 他不長久責備， 也不永遠懷怒。 他沒有按我們的罪過待我們， 也沒有照我們的罪孽報應我們。 ",
    "詩篇 103:11-14 天離地何等的高， 他的慈愛向敬畏他的人也是何等的大！ 東離西有多遠， 他叫我們的過犯離我們也有多遠！父親怎樣憐憫他的兒女， 耶和華也怎樣憐憫敬畏他的人！ 因為他知道我們的本體， 思念我們不過是塵土。",
    "箴言 16:32 不輕易發怒的，勝過勇士；治服己心的，強如取城。",
    "哥林多前書 13:4-7 愛是恆久忍耐，又有恩慈；愛是不嫉妒；愛是不自誇，不張狂， 不做害羞的事，不求自己的益處，不輕易發怒，不計算人的惡， 不喜歡不義，只喜歡真理； 凡事包容，凡事相信，凡事盼望，凡事忍耐。 愛是永不止息。",
    "希伯來書 11:1 信就是所望之事的實底，是未見之事的確據。",
    "羅馬書 8:38-39 因為我深信：無論是死、是生，是天使、是掌權的，是現在的事，是將來的事，是有能力的，是高天的、是深淵的，或是任何別的被造之物，都不能叫我們與　神的愛隔絕，這愛是在我們的主耶穌基督裡的。",
    "以弗所書 3:17-19 使基督藉著你們的信心住在你們心裡，使你們在愛中扎根、堅立， 以便能夠與眾聖徒一同領悟基督的愛是多麼長闊高深， 並知道基督的愛是遠超過人所能理解的愛，好叫上帝無限的豐富充滿你們。",
    "雅各書 4:6-8 但他賜更多的恩典，所以經上說： 神阻擋驕傲的人， 賜恩給謙卑的人。故此，你們要順服神。務要抵擋魔鬼，魔鬼就必離開你們逃跑了。你們親近神，神就必親近你們。有罪的人哪，要潔淨你們的手！心懷二意的人哪，要清潔你們的心！",
    "雅各書 4:14-15 其實明天如何，你們還不知道。你們的生命是甚麼呢？你們原來是一片雲霧，出現少時就不見了。你們只當說：「主若願意，我們就可以活着，也可以做這事，或做那事。」",
    "雅各書 4:16 人若知道行善，卻不去行，這就是他的罪了。",
    "馬太福音 6:32-33 你們需要這一切東西，你們的天父都知道。 你們要先求上帝的國和他的義，這些東西都要加給你們了。",
    "馬太福音 6:34 所以，不要為明天憂慮，因為明天自有明天的憂慮；一天的難處一天當就夠了。」",
    "馬太福音 6:9-13 我們在天上的父： 願人都尊你的名為聖。願你的國降臨；願你的旨意行在地上，如同行在天上。我們日用的飲食，今日賜給我們。免我們的債，如同我們免了人的債。不叫我們陷入試探；救我們脫離那惡者。因為國度、權柄、榮耀，全是你的，直到永遠。阿們！』",
    "馬太福音 6:14-15 你們若饒恕人的過犯，你們的天父也必饒恕你們； 你們若不饒恕人，你們的天父也必不饒恕你們的過犯。」",
    "馬太福音 6:24 一個人不能服侍兩個主；他不是恨這個愛那個，就是重這個輕那個。你們不能又服侍上帝，又服侍瑪門。",
    "詩篇 16:4 以別神代替耶和華的， 他們的愁苦必加增； 他們所澆奠的血我不獻上； 我嘴唇也不提別神的名號。",
    "約翰福音 14:6-7 耶穌說：「我就是道路、真理、生命，若不藉著我，沒有人能到父那裡。 你們若認識我，也會認識我的父。從現在起，你們不但認識祂，而且也看見祂了。」",
    "路加福音 8:15  但那落在好土裡的，就是人用誠實良善的心來聽，把道持守住，忍耐著結出果實。",
]


var random_int = Int.random(in:0...gold_words.count-1);

func reschdule()
{
    UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge]) { (success, error) in
        if success{
            print("All set")
        } else if let error = error {
            print(error.localizedDescription)
        }
    }

    let content = UNMutableNotificationContent()
    content.title = "Ruby加油,堅持做對的事！"
    content.subtitle = gold_words[Int.random(in:0...gold_words.count-1)]
    content.sound = .default
    content.categoryIdentifier = "myCategory"
    let category = UNNotificationCategory(identifier: "myCategory", actions: [], intentIdentifiers: [], options: [])
    UNUserNotificationCenter.current().setNotificationCategories([category])
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3600, repeats: true)
    //let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)

    let request = UNNotificationRequest(identifier: "milk", content: content, trigger: trigger)
    UNUserNotificationCenter.current().add(request)
    { (error) in
        if let error = error{
            print(error.localizedDescription)
        }else{
            print("scheduled successfully")
        }
    }

}

struct ContentView: View {

    @State var buttonPressed = false
    @State var schduled = false


    var body: some View {
        ScrollView(.vertical){
            VStack {

                /// support for if-else introduced in Xcode 12
                if buttonPressed {

                }

                Button(action: {
                    reschdule()
                    buttonPressed.toggle()

                }) {
                    Text(gold_words[Int.random(in:0...gold_words.count-1)])
                    //.font(.system(size: 18, weight: .light, design: .serif))
                    //.font(.custom("PingFangTC-Medium",fixedSize: 16))
                    .font(.custom("PingFangTC-Semibold",fixedSize: 18))
                    .foregroundStyle(.gray)

                }.buttonStyle(.plain)
                   // .frame(maxWidth: .infinity)
            }
        }
    }

    /*
    var body: some View {
        Text(gold_words[Int.random(in:0...gold_words.count-1)])
            .font(.system(size: 16, weight: .light, design: .serif))
    }
     */
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
