//
//  ViewController.swift
//  Holi
//
//  Created by Alandis Seals on 11/16/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var collectionView: UICollectionView!
    
    
    private var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    private var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
    private var section: [Section] = []
    
    lazy var collectionViewLayout: UICollectionViewLayout = {
        let layout = UICollectionViewCompositionalLayout { [weak self] (sectionIndex, env) -> NSCollectionLayoutSection? in
            guard let self = self else { return nil }
            
            let snapshot = self.dataSource.snapshot()
            let sectionKind = snapshot.sectionIdentifiers[sectionIndex].kind
            
            switch sectionKind {
            case .feature!:
                return LayoutSectionSectionFactory().layout()
                
            default: return nil
            }
            
        }
        return layout
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
   private func setup() {
        registerCells()
       setupDataSource()
       dummyData()
    }
    
    private func dummyData() {
        let section = [
            Section(kind: .feature!, items: [Item(),Item(),Item(),Item()])
        ]
        
        snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections(section)
        section.forEach { snapshot.appendItems($0.items, toSection: $0) }
        dataSource.apply(snapshot, animatingDifferences: false)
            
        
    }
    
    private func registerCells() {
        let cells: [RegisterableView] = [
            .nib(FeaturedCell.self)
        ]
        collectionView.register(cells: cells)
        
        collectionView.collectionViewLayout = collectionViewLayout
    }
    
    private func setupDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView) { [weak self]  (collectionView, indexPath, itemIdentifier) in
            guard let self = self else { return UICollectionViewCell() }
            let snapshot = self.dataSource.snapshot()
            let sectionKind = snapshot.sectionIdentifiers[indexPath.section].kind
            
            switch sectionKind {
            case .feature!:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeaturedCell.reuseIdentifier, for: indexPath)
                return cell
                
            default: return nil
            }
        }
        
    }


}

