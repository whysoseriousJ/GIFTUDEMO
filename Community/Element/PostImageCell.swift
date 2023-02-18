//
//  PostImageCell.swift
//  GIFTU
//
//  Created by 张健毓 on 2022/12/15.
//

import SwiftUI

private let kImageSpace: CGFloat = 6

struct PostImageCell: View {
    let images: [String]
    let width: CGFloat
    
    var body: some View {
        Group {
            if images.count == 1 {
                loadImage(name: images[0])
                    .resizable()
                    .scaledToFill()
                    .frame(width: width, height: width * 0.75)
                    .clipped()
            } else if images.count == 2 {
                PostImageCellRow(images: images, width: width)
            } else if images.count == 3 {
                PostImageCellRow(images: images, width: width)
            } else if images.count == 4 {
                VStack(alignment: .center, spacing: kImageSpace) {
                    PostImageCellRow(images: Array(images[0...1]), width: width)
                    PostImageCellRow(images: Array(images[2...3]), width: width)
                }
            } else if images.count == 5 {
                VStack(alignment: .center, spacing: kImageSpace) {
                    PostImageCellRow(images: Array(images[0...1]), width: width)
                    PostImageCellRow(images: Array(images[2...4]), width: width)
                }
                
            } else if images.count == 6 {
                VStack(alignment: .center, spacing: kImageSpace) {
                    PostImageCellRow(images: Array(images[0...2]), width: width)
                    PostImageCellRow(images: Array(images[3...5]), width: width)
                }
            } else if images.count == 7 {
                    VStack(alignment: .center, spacing: kImageSpace) {
                        PostImageCellRow(images: Array(images[0...1]), width: width)
                        PostImageCellRow(images: Array(images[2...4]), width: width)
                        PostImageCellRow(images: Array(images[5...6]), width: width)
                }
            } else if images.count == 8 {
                VStack(alignment: .center, spacing: kImageSpace) {
                    PostImageCellRow(images: Array(images[0...2]), width: width)
                    PostImageCellRow(images: Array(images[3...5]), width: width)
                    PostImageCellRow(images: Array(images[6...7]), width: width)
                }
            } else if images.count == 9 {
                VStack(alignment: .center, spacing: kImageSpace) {
                    PostImageCellRow(images: Array(images[0...2]), width: width)
                    PostImageCellRow(images: Array(images[3...5]), width: width)
                    PostImageCellRow(images: Array(images[6...8]), width: width)
                }
            }
        }
        
    }
}

struct PostImageCellRow: View {
    let images: [String]
    let width: CGFloat
    
    var body: some View {
        HStack(alignment: .center, spacing: kImageSpace) {
            ForEach(images, id: \.self) { image in
                loadImage(name: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: (self.width - kImageSpace * CGFloat(self.images.count - 1)) / CGFloat(self.images.count), height: (self.width - kImageSpace * CGFloat(self.images.count - 1)) / CGFloat(self.images.count))
                .clipped()
            }
        }
    }
}

struct PostImageCell_Previews: PreviewProvider {
    static var previews: some View {
        let images = UserDataC().recommendPostList.list[0].images
        let width = UIScreen.main.bounds.width
        return Group {
            // 1张图
            PostImageCell(images: Array(images[0...0]), width: width)
            // 2张图
            PostImageCell(images: Array(images[0...1]), width: width)
            // 3张图
            PostImageCell(images: Array(images[0...2]), width: width)
            // 4张图
            PostImageCell(images: Array(images[0...3]), width: width)
            // 5张图
            PostImageCell(images: Array(images[0...4]), width: width)
            // 6张图
            PostImageCell(images: Array(images[0...5]), width: width)
            // 7张图
            PostImageCell(images: Array(images[0...6]), width: width)
            // 8张图
            PostImageCell(images: Array(images[0...7]), width: width)
            // 9张图
            PostImageCell(images: Array(images[0...8]), width: width)
        }
        // 指定自动预览页的宽高，在指定多个预览页的情况下十分有用
        .previewLayout(.fixed(width: width, height: 300))
    }
}
