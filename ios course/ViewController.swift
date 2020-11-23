// uinavigationController

import UIKit

class ViewControllerA: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Screen A"
        view.backgroundColor = .white
        
        let nextButton = UIButton(type: .system)
        nextButton.setTitle("Go Screen B", for: .normal)
        nextButton.frame = CGRect(x: 0, y: 100, width: 100, height: 100)
        view.addSubview(nextButton)
        
        let openModal = UIButton(type: .system)
        openModal.setTitle("open modal C", for: .normal)
        openModal.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        view.addSubview(openModal)
        
        nextButton.addTarget(self, action: #selector(onButtonTouchUpInside(_:)), for: .touchUpInside)
        openModal.addTarget(self, action: #selector(openModal(_:)), for: .touchUpInside)
    }

    @objc func onButtonTouchUpInside(_ sender: UIButton) {
        navigationController?.pushViewController(ViewControllerB(), animated: false)
    }
    
    @objc func openModal(_ sender: UIButton) {
        let navigationController = UINavigationController(rootViewController: ViewControllerC())
        present(navigationController, animated: true, completion: .none)
    }
}

class ViewControllerB: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Screen B"
        view.backgroundColor = .white
        
        let backButton = UIButton(type: .system)
        backButton.setTitle("Back to Screen A", for: .normal)
        backButton.frame = CGRect(x: 0, y: 100, width: 100, height: 100)
        view.addSubview(backButton)
        
        let nextButton = UIButton(type: .system)
        nextButton.setTitle("Go to Screen C", for: .normal)
        nextButton.frame = CGRect(x: 0, y: 200, width: 100, height: 100)
        view.addSubview(nextButton)
        
        backButton.addTarget(self, action: #selector(onButtonTouchUpInside(_:)), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(onNextButtonTouch), for: .touchUpInside)
    }
    
    @objc func onButtonTouchUpInside(_ sender: UIButton) {
        navigationController?.popViewController(animated: false)
    }
    
    @objc func onNextButtonTouch(_ sender: UIButton) {
        navigationController?.pushViewController(ViewControllerC(), animated: false)
    }
    
}


class ViewControllerC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Screen C"
        view.backgroundColor = .white
        
        let jumpButton = UIButton(type: .system)
        jumpButton.setTitle("Jump to Screen A", for: .normal)
        jumpButton.frame = CGRect(x: 0, y: 100, width: 100, height: 100)
        view.addSubview(jumpButton)
        
        jumpButton.addTarget(self, action: #selector(onButtonTouchUpInside(_:)), for: .touchUpInside)
        
//        dismiss(animated: true, completion: .none)
    }
    
    @objc func onButtonTouchUpInside(_ sender: UIButton) {
        let viewControllerA = navigationController?.viewControllers.first(where: {
            $0 is ViewControllerA
        })
        
        guard let _toVc = viewControllerA  else { return }
        navigationController?.popToViewController(_toVc, animated: false)
    }
    
}
