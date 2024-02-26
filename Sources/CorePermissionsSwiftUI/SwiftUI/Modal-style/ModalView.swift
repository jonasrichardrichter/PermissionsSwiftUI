//
//  ModalView.swift
//
//
//  Created by Jevon Mao on 1/30/21.
//

import SwiftUI
import SwiftUIIntrospect

@available(iOS 13.0, tvOS 13.0, *)
struct ModalView: View {
    @EnvironmentObject var store: PermissionStore
    @EnvironmentObject var schemaStore: PermissionSchemaStore

    @Binding var showModal: Bool
    var mainText: MainTexts{store.mainTexts.contentChanged ? store.mainTexts : store.configStore.mainTexts}

    var body: some View {
        ScrollView {
            VStack { 
                HeaderView(exitButtonAction: {showModal = schemaStore.shouldStayInPresentation}, mainText: mainText)
                    
                PermissionSection(showing: $showModal)
                    .background(Color(.systemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .padding()
                    .frame(maxWidth:UIScreen.main.bounds.width-30)

                Text(.init(mainText.bottomDescription))
                    .font(.system(.callout, design: .rounded))
                    .foregroundColor(Color(.systemGray))
                    .padding(.horizontal)
                    .textHorizontalAlign(.leading)

                Spacer()
            }
            .padding(.bottom,30)

        }
        .background(Color(.secondarySystemBackground))
        .edgesIgnoringSafeArea(.all)
        .introspect(.viewController, on: .iOS(.v13, .v14, .v15, .v16, .v17)) { viewControler in
            if store.configStore.restrictDismissal ||
                store.restrictAlertDismissal ||
                store.restrictModalDismissal {
                viewControler.isModalInPresentation = true
            }
        }
    }
}
