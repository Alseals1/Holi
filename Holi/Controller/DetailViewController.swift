import UIKit

class DetailViewController: UIViewController {
    
    private var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    private var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
    
    private var section = [Section]()

    @IBOutlet weak var collectionView: UICollectionView!
    
    lazy var collectionViewLayout: UICollectionViewLayout = {
        let layout = UICollectionViewCompositionalLayout { [weak self] (sectionIndex, env) -> NSCollectionLayoutSection? in
            guard let self = self else { return nil }
            
            let snapshot = self.dataSource.snapshot()
            let sectionKind = snapshot.sectionIdentifiers[sectionIndex].kind
            
            switch sectionKind {
                case  .detailImage:
                    return LayoutSectionSectionFactory().detailImageLayout()
                case .detailInfo:
                    return LayoutSectionSectionFactory().detailInfoLayout()
                case .recomendations:
                    return LayoutSectionSectionFactory().recommendationLayout()
                case .location:
                    return LayoutSectionSectionFactory().locationtInfoLayout()
                case .aboutGuide:
                    return LayoutSectionSectionFactory().aboutGuideLayout()
                case .similiarEvents:
                    return LayoutSectionSectionFactory().similiarEventLayout()
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
    
  private func registerCells() {
      let cells: [RegisterableView] = [
        .nib(DetailImagCell.self),
        .nib(DetailInfoCell.self),
        .nib(RecommendationsCell.self),
        .nib(MapCell.self),
        .nib(AboutGuideCell.self),
        .nib(FeaturedCell.self)
      ]
      collectionView.register(cells: cells)
      collectionView.collectionViewLayout = collectionViewLayout
    }
    
    private func dummyData() {
        let section = [
            Section(kind: .detailImage, items: [Item(),Item(),Item()]),
            Section(kind: .detailInfo, items: [Item()]),
            Section(kind: .recomendations, items: [Item()]),
            Section(kind: .location, items: [Item()]),
            Section(kind: .aboutGuide, items: [Item()]),
            Section(kind: .similiarEvents, items: [Item(),Item(),Item(),Item()])
        ]
        
        snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections(section)
        section.forEach { snapshot.appendItems($0.items, toSection: $0) }
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    
    private func setupDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView) { [weak self] (collectionView, indexPath, itemIdentifier) in
            
            guard let self = self else { return UICollectionViewCell() }
            
            let snapshot = self.dataSource.snapshot()
            let sectionKind = snapshot.sectionIdentifiers[indexPath.section].kind
            
            switch sectionKind {
                case .detailImage:
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailImagCell.reuseIdentifier, for: indexPath)
                    
                    return cell
                    
                case .detailInfo:
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailInfoCell.reuseIdentifier, for: indexPath)
                    
                    return cell
                case .recomendations:
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendationsCell.reuseIdentifier, for: indexPath)
                    
                    return cell
                    
                case .aboutGuide:
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AboutGuideCell.reuseIdentifier, for: indexPath)
                    
                    return cell
                case .location:
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MapCell.reuseIdentifier, for: indexPath)
                    
                    return cell
                case .similiarEvents:
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeaturedCell.reuseIdentifier, for: indexPath)
                    
                    return cell
                    
                default: return nil
            }
            
            
            
        }
    }

   
 /*   private func setupHeader() {
        dataSource?.supplementaryViewProvider = { [weak self] collectionView, kind, indexPath in
            guard let self = self else { return }
            
            let snapshot = self.dataSource.snapshot()
            let sectionKind = snapshot.sectionIdentifiers[indexPath.section].kind
            
            switch sectionKind {
                case .detailImage:
                    let header = collectionView.dequeueReusableCell(withReuseIdentifier: HeaderView.reuseIdentifier, for: indexPath) as! HeaderView
                    header.title("Hiking event • Expert exper")
                    return header
                    
                default: return nil
                    
            }
            
        }
    }*/
}
