//
//  ViewController.swift
//  TravelDestinationProject
//
//  Created by GEU on 30/01/26.
//

import UIKit

class DestinationsViewController: UIViewController {

    var destinationData = DestinationsData()
    @IBOutlet weak var destinationsCollectionView: UICollectionView!
    var beachDestinations: [Destination] = []
    var mountainDestinations: [Destination] = []
    var urbanDestinations: [Destination] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(destinationData.destinations(for: .beach))
        
        beachDestinations = destinationData.destinations(for: .beach)
        mountainDestinations = destinationData.destinations(for: .mountains)
        urbanDestinations = destinationData.destinations(for: .urban)
        
        registerCells()
        
        destinationsCollectionView.setCollectionViewLayout(generateLayout(), animated: true)
        destinationsCollectionView.register(UINib(nibName: "SectionHeaderViewCollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header_view")
        
        destinationsCollectionView.dataSource = self
    }
    func registerCells(){
        // register the beaches
        //passing nil means passing to the main bundle, bundle is like a folder
        destinationsCollectionView.register(UINib(nibName: "BeachCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "beach_cell")
        destinationsCollectionView.register(UINib(nibName: "MountainCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "mountain_cell")
        destinationsCollectionView.register(UINib(nibName: "UrbanCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "urban_cell")
       
    }
}

extension DestinationsViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0{
            return beachDestinations.count
        }
        else if section == 1{
            return mountainDestinations.count
        }
        else if section == 2{
            return urbanDestinations.count
        }
        return 0
    
}
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "beach_cell", for: indexPath) as! BeachCollectionViewCell
            let destination = beachDestinations[indexPath.row]
            
            cell.configureCell(destination: destination)
            return cell
        }
        else if indexPath.section == 1{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mountain_cell", for: indexPath) as! MountainCollectionViewCell
            let destination = mountainDestinations[indexPath.row]
            
            cell.configureCell(with: destination)
            return cell
        }
        else if indexPath.section == 2{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "urban_cell", for: indexPath) as! UrbanCollectionViewCell
            let destination = urbanDestinations[indexPath.row]
            
            cell.configureCell(destination: destination)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
          guard kind == UICollectionView.elementKindSectionHeader else {
              return UICollectionReusableView()
          }
          let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header_view", for: indexPath) as! SectionHeaderViewCollectionReusableView

          switch indexPath.section {
          case 0:
              headerView.configure(with: "Top Beaches")
          case 1:
              headerView.configure(with: "Top Mountains")
          case 2:
              headerView.configure(with: "Top Urban Spots")
          default:
              headerView.configure(with: "")
          }

          return headerView
      }
    
    func generateLayout()->UICollectionViewLayout{
        
        let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection in
            
            let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(55))
            let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .topLeading)
            
            
            if sectionIndex == 0 {
                let section = self.generateSectionForBeachDestinations()
                section.boundarySupplementaryItems = [header]
                return section
                
            }
            else if sectionIndex == 1{
                let section = self.generateSectionForMountainsDestinations()
                section.boundarySupplementaryItems = [header]
                return section
            }
            else if sectionIndex == 2{
              let section = self.generateSectionForUrbanDestinations()
                section.boundarySupplementaryItems = [header]
                return section
            }
            return self.generateSectionForBeachDestinations()
        }
       
        return layout
    }
   
    // separate function to make the layout for beaches
    func generateSectionForBeachDestinations() -> NSCollectionLayoutSection {

        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )

        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        item.contentInsets = NSDirectionalEdgeInsets(
            top: 0,
            leading: 10,
            bottom: 0,
            trailing: 10
        )

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(300)
        )

        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )

        let section = NSCollectionLayoutSection(group: group)

        section.interGroupSpacing = 10

       section.contentInsets = NSDirectionalEdgeInsets(
            top: 10,
            leading: 15,
            bottom: 20,
            trailing: 15
        )

       section.orthogonalScrollingBehavior = .groupPagingCentered

        return section
    }

    
    func generateSectionForMountainsDestinations() -> NSCollectionLayoutSection {

        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )

        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        item.contentInsets = NSDirectionalEdgeInsets(
            top: 0,
            leading: 10,
            bottom: 0,
            trailing: 10
        )

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(200)
        )

        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )

        let section = NSCollectionLayoutSection(group: group)

        section.interGroupSpacing = 10

        section.contentInsets = NSDirectionalEdgeInsets(
            top: 10,
            leading: 15,
            bottom: 20,
            trailing: 15
        )

        section.orthogonalScrollingBehavior = .groupPagingCentered

        return section
    }

    
    func generateSectionForUrbanDestinations() -> NSCollectionLayoutSection {

        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(180)
        )

        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        item.contentInsets = NSDirectionalEdgeInsets(
            top: 0,
            leading: 10,
            bottom: 0,
            trailing: 10
        )

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(200)
        )

        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize,
            subitems: [item]
        )

        let section = NSCollectionLayoutSection(group: group)

        section.interGroupSpacing = 15

        section.contentInsets = NSDirectionalEdgeInsets(
            top: 10,
            leading: 15,
            bottom: 30,
            trailing: 15
        )

        return section
    }

    
}

