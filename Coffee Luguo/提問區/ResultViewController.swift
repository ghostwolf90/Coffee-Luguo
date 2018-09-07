//
//  ResultViewController.swift
//  Coffee Luguo
//
//  Created by 陳冠宇 on 2015/9/19.
//  Copyright © 2015年 陳冠宇. All rights reserved.
//

import UIKit


class ResultViewController: UIViewController {
    private var titleLabel = ""
    private var detailString = ""
    private var resultCoffeeImages = ["coffee01", "coffee02"]
    private var uTubeAdress: [String] = ["35gCiF22P0k", "35gCiF22P0k", "35gCiF22P0k", "35gCiF22P0k", "35gCiF22P0k"]
    private var mainLabelText = ["極品藍山", "三多士", "哥倫比亞", "摩卡", "爪哇", "曼特寧"]
    private var locationText = ["牙買加", "巴西", "哥倫比亞", "衣索比亞", "印尼", "蘇門答臘"]
    private var subLabelString: [String] = ["藍山咖啡，主要是因為產地位居牙買加的藍山上，所以以藍山來命名。當地栽種的咖啡為阿拉比卡品種，藍山咖啡香味較淡，但喝起來卻非常香醇滑口，沒有苦苦的味道，但它卻帶了一點點的酸，馥郁的果香，優質且均衡的內容，一般都單品種飲用，乃咖啡中最好品種。因為產量極少，價格昂貴，一般人很少喝得到真正的藍山，多是味道極近似的咖啡所調製，但價格仍比一般咖啡高昂。藍山咖啡豆的形狀飽滿，而且平均比一般豆子還要大，中間的白色裂紋，是經過水洗的處理。它產自牙買加藍山海拔2500尺以上的斜坡上，屬於咖啡中的極品，價位也是最高的一種，它的產量有限，但大都被日本、美國和英國的咖啡買家壟斷，所以市面上的藍山大多不是純正的，購買時必須小心！例如有一種來自中美洲的『大象豆』，就是一種常見的仿冒品！要特別注意的是→千萬別貪小便宜！如果你買的藍山咖啡豆，價位只比一般哥倫比亞豆貴個２０％，這裡面真的藍山豆大概不會超過２０％。",
        "來自南美洲巴西為世界第一的咖啡生產國約占全球總生產量的30%山多士咖啡幾乎都產于巴西東南部為巴西咖啡中的極品生豆顆粒從中型到大型都有但不帶綠色屬中性咖啡巴 西 維奇高提莊園來自巴西頂級精品咖啡莊園Fazenda Vargem Grande之極品中等濃稠度帶有核果印度香料餘韻與溫潤滑順的口感!",
        "哥倫比亞咖啡，是阿拉比卡咖啡種中相當具有代表性的一個優良的品種，是傳統的深度烘烤咖啡，具有濃烈而值得懷念的味道。它的香氣濃郁而厚實，帶有明朗的優質酸性，高均衡度，有時具有堅果味，回味無窮，不論是外觀上、品質上，哥倫比亞咖啡都相當優良，像女人隱約的嬌媚，迷人且恰到好處。",
        "目前以葉門所生產的咖啡為最佳，其次為依索比亞的摩卡。摩卡咖啡帶獨特之甘，酸，苦味極為優雅，為一般高級人士所喜愛的優良品種，普通皆單品種飲用，飲之潤滑可口，醇味歷久不退，若調配綜合咖啡,更是一種理想的品種。摩卡原指由阿拉伯的摩卡港運山的豆子，位於阿拉伯半島上葉門(Yemen)的國家內，今日的純稀有的葉門摩卡已十份罕見，純正的摩卡稀有價位昂貴，風味濃郁且香醇，而口感中酸味強。 摩卡的豆行較尖長，以日曬法處理，所以中間的裂紋呈黑褐色。摩卡豆的最大特色在於豆色不平均，有時候甚至會豆子中發現軟石參雜其中。摩卡豆以酸度著稱，為了提昇風味的豐富性，在綜合咖啡中也常見到他。",
        "作為調配綜合咖啡最理想的豆子，其酸性極少，苦味強烈，煎焙較淺薄，則有如大豆之味，煎焙過度則苦味娛強，因此最適合配合使用。為了提昇風味的豐富性，純品飲者較少，是南洋咖啡之代表品種。綜合咖啡若調上羅姆斯達咖啡，可使咖啡濃度增強,甘味增加。   羅姆斯達是產於印尼的豆子，爪哇已成為一個咖啡中心，味苦而香醇濃郁，印尼豆帶土氣，配合狂野、醇酒般的葉門摩卡豆是不錯的組合。從前爪哇是阿拉伯種，現在的是羅弗斯達種。在1920年發生了病害，大多數生產園荒廢，從那以後改種抵抗力強的羅弗斯達種。",
        "在藍山尚未公諸於世時，曼特寧咖啡是被認為世界第一優良品。屬強性品種，風味特殊，質感濃郁，芳香，沒有柔和的酸味，強烈的苦味是它獨到之處，而且它的醇度特強，一般都是單品種飲用，但調配合綜合咖啡時，也是不可或缺的品種，故多年來一直是綜合咖啡的主要支柱。對於不喜歡有酸味的咖啡的人，是一項很好的選擇。曼特寧和爪哇相同的產於印尼產地，但曼特寧品質較穩定，為蘇門答臘中最具代表性的咖啡。豆粒甚大，呈黃色或褐色，生產量比較少，故價錢高。"]
    
    var result:Float = 0.0
    
    @IBOutlet weak var backHomeBtn: UIButton!    
    @IBOutlet weak var resultTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backHomeBtn.layer.cornerRadius = 8
        print(result)
        sortHat(result: result)
    }
    
    func sortHat(result: Float){
        switch result {
        case 0.0..<10.0:
            titleLabel = mainLabelText[0]
            detailString = subLabelString[0]
        case 10..<20:
            titleLabel = mainLabelText[1]
            detailString = subLabelString[1]
        case 20..<30:
            titleLabel = mainLabelText[2]
            detailString = subLabelString[2]
        case 30..<40:
            titleLabel = mainLabelText[3]
            detailString = subLabelString[3]
        case 40..<50:
            titleLabel = mainLabelText[4]
            detailString = subLabelString[4]
        case 50..<60:
            titleLabel = mainLabelText[5]
            detailString = subLabelString[5]
        default:
            titleLabel = "哈哈"
            detailString = "GG"
        }
    }
    
    @IBAction func backPressed(_ sender: UIButton) {
        print("GOGO")
        let record = RLM_Record()
        record.name         = titleLabel
        record.creatTime    = Int(Date().timeIntervalSince1970)
        RLM_RecordUtil.sharedInstance.saveRecord(record:record , completion: {isSuccess in
            print("Save Record is Success")
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.openYoutube()
    }
    
    func openYoutube() {
        //self.uTubeView.loadWithVideoId(self.uTubeAdress[self.result])
    }
}

extension ResultViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 200
        }else if indexPath.row == 1 {
            return 250
        }
        return 64
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "RimageCell", for: indexPath as IndexPath) as! ResultImageTableViewCell
            cell.resultImage.image = UIImage(named: resultCoffeeImages[0])
            cell.resultTitle.text = titleLabel
            cell.selectionStyle = .none
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "descriptCell", for: indexPath as IndexPath) as! DescriptTableViewCell
            cell.selectionStyle = .none
            if titleLabel.count > 0 {
                cell.descriptTitleLabel.text     = titleLabel
                cell.descriptDetailLabel.text    = detailString
            }
            return cell
        default:
            return UITableViewCell()
        }
        
        
    }
    
    
}
