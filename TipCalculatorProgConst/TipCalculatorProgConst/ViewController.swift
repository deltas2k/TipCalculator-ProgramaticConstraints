//
//  ViewController.swift
//  TipCalculatorProgConst
//
//  Created by Matthew O'Connor on 10/22/19.
//  Copyright © 2019 Matthew O'Connor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var safeArea: UILayoutGuide {
        return self.view.safeAreaLayoutGuide
    }
    var buttons:[UIButton] {
        return [fivePercentButton,tenPercentButton,fifteenPercentButton,twentyPercentButton]
    }
    
    var totalBeforeTip: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addAllSubviews()
        setupStackView()
        constrainViews()
        self.view.backgroundColor = .white
        activateButtons()
        
    }
    
    //MARK: -Create Subviews
    
    let billTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter bill Total..."
        textField.borderStyle = .line
        textField.layer.cornerRadius = 8
        return textField
    }()
    
    let tipPercentageLabel: UILabel = {
        let label = UILabel()
        label.text = "Tip Percentage"
        label.textColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        return label
    }()
    
    let fivePercentButton: UIButton = {
        let button = UIButton()
        button.setTitle("5%", for: .normal)
        button.setTitleColor(.systemTeal, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        button.layer.cornerRadius = 8
        return button
    }()
    
    let tenPercentButton: UIButton = {
        let button = UIButton()
        button.setTitle("10%", for: .normal)
        button.setTitleColor(.systemTeal, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        button.layer.cornerRadius = 8
        return button
    }()
    
    let fifteenPercentButton: UIButton = {
        let button = UIButton()
        button.setTitle("15%", for: .normal)
        button.setTitleColor(.systemTeal, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        button.layer.cornerRadius = 8
        return button
    }()
    
    let twentyPercentButton: UIButton = {
        let button = UIButton()
        button.setTitle("20%", for: .normal)
        button.setTitleColor(.systemTeal, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        button.layer.cornerRadius = 8
        return button
    }()
    
    let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 10
        return stackView
    }()
    
    let totalLabel: UILabel = {
        let label = UILabel()
        label.text = "Total Amount:"
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return label
    }()
    
    let amountPrintOutLabel: UILabel = {
        let label = UILabel()
        label.text = "0.00"
        label.textColor = .green
        label.layer.cornerRadius = 4
        label.layer.borderWidth = 1
        label.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.textAlignment = .center
        
        return label
    }()
    
    //MARK: - Add Subviews
    func addAllSubviews() {
        self.view.addSubview(billTextField)
        self.view.addSubview(tipPercentageLabel)
        self.view.addSubview(fivePercentButton)
        self.view.addSubview(tenPercentButton)
        self.view.addSubview(fifteenPercentButton)
        self.view.addSubview(twentyPercentButton)
        self.view.addSubview(buttonStackView)
        self.view.addSubview(totalLabel)
        self.view.addSubview(amountPrintOutLabel)
    }
    
    func setupStackView() {
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.addArrangedSubview(fivePercentButton)
        buttonStackView.addArrangedSubview(tenPercentButton)
        buttonStackView.addArrangedSubview(fifteenPercentButton)
        buttonStackView.addArrangedSubview(twentyPercentButton)
    }
    
    //MARK: -Contrain views
    func constrainViews() {
        billTextField.anchor(top: self.safeArea.topAnchor, bottom: nil, leading: self.safeArea.leadingAnchor, trailing: self.safeArea.trailingAnchor, topPadding: 40, bottomPadding: 0, leadingPadding: 100, trailingPadding: 20)
        
        tipPercentageLabel.anchor(top: billTextField.bottomAnchor, bottom: nil, leading: self.safeArea.leadingAnchor, trailing: self.safeArea.trailingAnchor, topPadding: 200, bottomPadding: 0, leadingPadding: 20, trailingPadding: 20)
        
        buttonStackView.anchor(top: tipPercentageLabel.bottomAnchor, bottom: nil, leading: self.safeArea.leadingAnchor, trailing: self.safeArea.trailingAnchor, topPadding: 20, bottomPadding: 0, leadingPadding: 8, trailingPadding: 8)
        
        totalLabel.anchor(top: buttonStackView.bottomAnchor, bottom: nil, leading: self.safeArea.leadingAnchor, trailing: self.safeArea.trailingAnchor, topPadding: 200, bottomPadding: 0, leadingPadding: 125, trailingPadding: 110)
        
        amountPrintOutLabel.anchor(top: buttonStackView.bottomAnchor, bottom: nil, leading: totalLabel.trailingAnchor, trailing: self.safeArea.trailingAnchor, topPadding: 200, bottomPadding: 0, leadingPadding: 20, trailingPadding: 0)
    }
    
    func activateButtons() {
        buttons.forEach{$0.addTarget(self, action: #selector(tipsButtonTapped(sender:)), for: .touchUpInside)}
    }
    @objc func tipsButtonTapped(sender: UIButton) {
        switch sender {
        case fivePercentButton:
            totalBeforeTip = billTextField.text ?? ""
            guard let bill = Double(totalBeforeTip) else {return}
            let tip = bill * 0.05
            let billTotal = bill + tip
            amountPrintOutLabel.text = "\(billTotal)"
        case tenPercentButton:
            totalBeforeTip = billTextField.text ?? ""
            guard let bill = Double(totalBeforeTip) else {return}
            let tip = bill * 0.10
            let billTotal = bill + tip
            amountPrintOutLabel.text = "\(billTotal)"
        case fifteenPercentButton:
            totalBeforeTip = billTextField.text ?? ""
            guard let bill = Double(totalBeforeTip) else {return}
            let tip = bill * 0.15
            let billTotal = bill + tip
            amountPrintOutLabel.text = "\(billTotal)"
        case twentyPercentButton:
            totalBeforeTip = billTextField.text ?? ""
            guard let bill = Double(totalBeforeTip) else {return}
            let tip = bill * 0.20
            let billTotal = bill + tip
            amountPrintOutLabel.text = "\(billTotal)"
        default:
            print("error")
        }
    }
    
}

