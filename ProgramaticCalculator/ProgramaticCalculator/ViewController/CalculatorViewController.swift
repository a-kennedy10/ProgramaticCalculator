//
//  CalculatorViewController.swift
//  ProgramaticCalculator
//
//  Created by Alex Kennedy on 10/13/20.
//  Copyright © 2020 Alex Kennedy. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    // MARK: - properties
    var safeArea: UILayoutGuide {
        return self.view.safeAreaLayoutGuide
    }
    
    var buttons: [UIButton] {
        return [tenPercentTipButton, fifteenPercentTipButton, twentyPercentTipButton, twentyfivePercentTipButton]
    }
    
    // MARK: - lifecycle
    override func loadView() {
        super.loadView()
        addAllSubviews()
        setupTitleStackView()
        setupBillStackView()
        setupButtonStackView()
        setupTipStackView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray
        activateButtons()
    }
    
    // MARK: - helper functions
    func addAllSubviews() {
        self.view.addSubview(tenPercentTipButton)
        self.view.addSubview(fifteenPercentTipButton)
        self.view.addSubview(twentyPercentTipButton)
        self.view.addSubview(twentyfivePercentTipButton)
        self.view.addSubview(buttonStackView)
        
        self.view.addSubview(titleLabel)
        self.view.addSubview(subtitleLabel)
        self.view.addSubview(titleStackView)
        
        self.view.addSubview(billLabel)
        self.view.addSubview(billTextField)
        self.view.addSubview(billStackView)
        
        self.view.addSubview(tipLabel)
        self.view.addSubview(tipAmountLabel)
        self.view.addSubview(tipStackView)
    }
    
    
    func setupButtonStackView() {
        buttonStackView.addArrangedSubview(tenPercentTipButton)
        buttonStackView.addArrangedSubview(fifteenPercentTipButton)
        buttonStackView.addArrangedSubview(twentyPercentTipButton)
        buttonStackView.addArrangedSubview(twentyfivePercentTipButton)
        buttonStackView.topAnchor.constraint(equalTo: self.billStackView.bottomAnchor, constant: SpacingConstants.smallVerticalBuffer).isActive = true
        buttonStackView.leadingAnchor.constraint(equalTo: self.safeArea.leadingAnchor, constant: SpacingConstants.smallHorizontalBuffer).isActive = true
        buttonStackView.trailingAnchor.constraint(equalTo: self.safeArea.trailingAnchor, constant: SpacingConstants.smallHorizontalBuffer).isActive = true
    }
    
    func setupTitleStackView() {
        titleStackView.addArrangedSubview(titleLabel)
        titleStackView.addArrangedSubview(subtitleLabel)
        titleStackView.topAnchor.constraint(equalTo: self.safeArea.topAnchor, constant: 0).isActive = true
        titleStackView.leadingAnchor.constraint(equalTo: self.safeArea.leadingAnchor, constant: SpacingConstants.smallHorizontalBuffer).isActive = true
        titleStackView.trailingAnchor.constraint(equalTo: self.safeArea.trailingAnchor, constant: SpacingConstants.smallHorizontalBuffer).isActive = true
    }
    
    func setupBillStackView() {
        billStackView.addArrangedSubview(billLabel)
        billStackView.addArrangedSubview(billTextField)
        billStackView.topAnchor.constraint(equalTo: self.titleStackView.bottomAnchor, constant: SpacingConstants.smallVerticalBuffer).isActive = true
        billStackView.leadingAnchor.constraint(equalTo: self.safeArea.leadingAnchor, constant: SpacingConstants.smallHorizontalBuffer).isActive = true
        billStackView.trailingAnchor.constraint(equalTo: self.safeArea.trailingAnchor, constant: SpacingConstants.mediumHorizontalBuffer).isActive = true
    }
    
    func setupTipStackView() {
        tipStackView.addArrangedSubview(tipLabel)
        tipStackView.addArrangedSubview(tipAmountLabel)
        tipStackView.topAnchor.constraint(equalTo: self.buttonStackView.bottomAnchor, constant: SpacingConstants.mediumVerticalBuffer).isActive = true
        tipStackView.bottomAnchor.constraint(equalTo: self.safeArea.bottomAnchor, constant: SpacingConstants.mediumVerticalBuffer).isActive = true
        tipStackView.trailingAnchor.constraint(equalTo: self.safeArea.trailingAnchor, constant: SpacingConstants.smallHorizontalBuffer).isActive = true
    }
    
    func activateButtons() {
        buttons.forEach { $0.addTarget(self, action: #selector(selectButton(sender:)), for: .touchUpInside) }
    }
    
    @objc func selectButton(sender: UIButton) {
        buttons.forEach { $0.setTitleColor(.orange, for: .normal) }
        switch sender {
        case tenPercentTipButton:
            guard let billAmountText = self.billTextField.text,
                let billAmount = Double(billAmountText) else { return }
            let tipPercent = 0.1
            let tipAmount = billAmount * tipPercent
            let roundedTipAmount = (100 * tipAmount).rounded() / 100
            
            tipAmountLabel.text = "\(roundedTipAmount)"
            
        case fifteenPercentTipButton:
            guard let billAmountText = self.billTextField.text,
                let billAmount = Double(billAmountText) else { return }
            let tipPercent = 0.15
            let tipAmount = billAmount * tipPercent
            let roundedTipAmount = (100 * tipAmount).rounded() / 100
            
            tipAmountLabel.text = "\(roundedTipAmount)"
           
        case twentyPercentTipButton:
            guard let billAmountText = self.billTextField.text,
                let billAmount = Double(billAmountText) else { return }
            let tipPercent = 0.2
            let tipAmount = billAmount * tipPercent
            let roundedTipAmount = (100 * tipAmount).rounded() / 100
            
            tipAmountLabel.text = "\(roundedTipAmount)"
        case twentyfivePercentTipButton:
            guard let billAmountText = self.billTextField.text,
                let billAmount = Double(billAmountText) else { return }
            let tipPercent = 0.25
            let tipAmount = billAmount * tipPercent
            let roundedTipAmount = (100 * tipAmount).rounded() / 100
            
            tipAmountLabel.text = "\(roundedTipAmount)"
        default: break
            
        }
    }

    // buttons
    let tenPercentTipButton: UIButton = {
        let button = UIButton()
        button.setTitle("10%", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.contentHorizontalAlignment = .center
        return button
    }()
    
    let fifteenPercentTipButton: UIButton = {
        let button = UIButton()
        button.setTitle("15%", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.contentHorizontalAlignment = .center
        return button
    }()
    
    let twentyPercentTipButton: UIButton = {
        let button = UIButton()
        button.setTitle("20%", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.contentHorizontalAlignment = .center
        return button
    }()
    
    let twentyfivePercentTipButton: UIButton = {
        let button = UIButton()
        button.setTitle("25%", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.contentHorizontalAlignment = .center
        return button
    }()
    
    let buttonStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalCentering
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // bill
    let billLabel: UILabel = {
        let label = UILabel()
        label.text = "Bill:"
        return label
    }()
    
    let billTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 300, y: 40, width: 100.00, height: 30.00))
        return textField
    }()
    
    let billStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // tip
    let tipLabel: UILabel = {
        let tip = UILabel()
        tip.text = "Tip:"
        return tip
    }()
    
    let tipAmountLabel: UILabel = {
        let tip = UILabel()
        return tip
    }()
    
    let tipStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // title
    let titleLabel: UILabel = {
       let title = UILabel()
        title.text = "Don't Be Cheap"
        return title
    }()
    
    let subtitleLabel: UILabel = {
        let subtitle = UILabel()
        subtitle.text = "Seriously, your servers aren't even paid a living wage"
        return subtitle
    }()
    
    let titleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
}
