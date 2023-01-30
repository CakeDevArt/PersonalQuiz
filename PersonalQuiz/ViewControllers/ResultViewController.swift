//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by brubru on 18.08.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var answers: [Answer] = []
    
    // 4. Избавиться от кнопки возврата назад на экране результатов

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        resultLabel.text = "Вы - \(mostFrequentElement(in: answers).type.rawValue)"
        descriptionLabel.text = "\(mostFrequentElement(in: answers).type.definition)"
    }
 
    
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    private func mostFrequentElement(in answers: [Answer]) -> Answer {
        var frequency = [Answer: Int]()
        for answer in answers {
            frequency[answer, default: 0] += 1
        }
        return frequency.max { a, b in a.value < b.value }?.key ?? .init(title: "", type: .cat)
    }
}
