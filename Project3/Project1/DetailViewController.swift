//
//  DetailViewController.swift
//  Project1
//
//  Created by Praveen Agarwal on 15/08/25.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    var index: (index: Int, count: Int)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Picture \(index?.index ?? 0) of \(index?.count ?? 0)"
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))

        guard let imageToDisplay = selectedImage else { return }
        imageView.image = UIImage(named: imageToDisplay)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    @objc func shareTapped() {
        guard let image = imageView.image?.jpegData(compressionQuality: 1), let imageName = selectedImage else { return }
        
        let activityVC = UIActivityViewController(activityItems: [image, imageName], applicationActivities: [])
        activityVC.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(activityVC, animated: true)
    }
}
