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
            case .feature:
                return LayoutSectionSectionFactory().layout()
            case .recommended:
                return LayoutSectionSectionFactory().recommendedLayout()
            case.latest:
                return LayoutSectionSectionFactory().latestLayout()
            case .categories:
                return LayoutSectionSectionFactory().categoriesLayout()
                
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
       setupHeader()
       dummyData()
    }
    
    private func dummyData() {
        let section = [
            Section(kind: .feature, items: [Item(),Item(),Item(),Item()]),
            Section(kind: .recommended, items: [Item(),Item(),Item(),Item()]),
            Section(kind: .latest, items: [Item(),Item(),Item(),Item(),Item()]),
            Section(kind: .categories, items: [Item(),Item(),Item(),Item(),Item()])
        ]
        
        snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections(section)
        section.forEach { snapshot.appendItems($0.items, toSection: $0) }
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    private func registerCells() {
        let cells: [RegisterableView] = [
            .nib(FeaturedCell.self),
            .nib(RecommendedCell.self),
            .nib(LatestCell.self),
            .nib(CategoriesCell.self)
        ]
        
        collectionView.register(cells: cells)
        collectionView.register(UINib(nibName: HeaderView.nib, bundle: nil), forSupplementaryViewOfKind: HeaderView.kind, withReuseIdentifier: HeaderView.reuseIdentifier)
        collectionView.collectionViewLayout = collectionViewLayout
    }
    
    private func setupDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView) { [weak self]  (collectionView, indexPath, itemIdentifier) in
            guard let self = self else { return UICollectionViewCell() }
            let snapshot = self.dataSource.snapshot()
            let sectionKind = snapshot.sectionIdentifiers[indexPath.section].kind
            
            switch sectionKind {
            case .feature:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeaturedCell.reuseIdentifier, for: indexPath)
                return cell
            case .recommended:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendedCell.reuseIdentifier, for: indexPath)
                return cell
            case .latest:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LatestCell.reuseIdentifier, for: indexPath)
                return cell
            case .categories:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCell.reuseIdentifier, for: indexPath)
                return cell
                
            default: return nil
            }
            
        
        }
        
    }
    
    private func setupHeader() {
        dataSource?.supplementaryViewProvider = { [weak self] collectionView, kind, indexPath in
            guard let self = self else { return nil}
            
            let snapshot = self.dataSource.snapshot()
            let sectionKind = snapshot.sectionIdentifiers[indexPath.section].kind
            
            
            switch sectionKind {
            case .feature:
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderView.reuseIdentifier, for: indexPath) as! HeaderView
                header.title("Feature")
                return header
            case .recommended:
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderView.reuseIdentifier, for: indexPath) as! HeaderView
                header.title("Recommended")
                return header
            case .latest:
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderView.reuseIdentifier, for: indexPath) as! HeaderView
                header.title("Latest")
                return header
            case .categories:
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderView.reuseIdentifier, for: indexPath) as! HeaderView
                header.title("Categories")
                return header
                
            default: return nil
            }
            
        }
    }

}

