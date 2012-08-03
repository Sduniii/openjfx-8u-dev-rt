/*
 * Copyright (c) 2012, Oracle and/or its affiliates. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.  Oracle designates this
 * particular file as subject to the "Classpath" exception as provided
 * by Oracle in the LICENSE file that accompanied this code.
 *
 * This code is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
 * version 2 for more details (a copy is included in the LICENSE file that
 * accompanied this code).
 *
 * You should have received a copy of the GNU General Public License version
 * 2 along with this work; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
 *
 * Please contact Oracle, 500 Oracle Parkway, Redwood Shores, CA 94065 USA
 * or visit www.oracle.com if you need additional information or have any
 * questions.
 */
package com.sun.javafx.scene.control.skin;

import com.preview.javafx.scene.control.TreeTableRow;
import com.preview.javafx.scene.control.TreeTableView;
import com.sun.javafx.scene.control.WeakEventHandler;
import com.sun.javafx.scene.control.behavior.TreeTableViewBehavior;
import java.lang.ref.WeakReference;
import javafx.collections.FXCollections;
import javafx.collections.ListChangeListener;
import javafx.collections.ListChangeListener.Change;
import javafx.collections.ObservableList;
import javafx.scene.control.SkinBase;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableRow;
import javafx.scene.control.TableView;
import javafx.scene.control.TreeItem;
import javafx.scene.layout.StackPane;
import javafx.util.Callback;

/**
 *
 */
public class TreeTableViewSkin<T> extends SkinBase<TreeTableView<T>, TreeTableViewBehavior<T>> {
    
    private final TableView<TreeItem<T>> table;

    public TreeTableViewSkin(final TreeTableView<T> control) {
        super(control, new TreeTableViewBehavior<T>(control));
        
        table = new TableView<TreeItem<T>>();
        
        // get defined columns
        updateColumns();
        control.getColumns().addListener(new ListChangeListener<TableColumn<TreeItem<T>, ?>>() {
            @Override public void onChanged(Change<? extends TableColumn<TreeItem<T>, ?>> change) {
                updateColumns();
            }
        });
        
        // install custom row factory to handle indentation
//        table.setRowFactory(new Callback<TableView<TreeItem<T>>, TreeTableRow<TreeItem<T>>>() {
        table.setRowFactory(new Callback<TableView<TreeItem<T>>, TableRow<TreeItem<T>>>() {
            @Override public TreeTableRow<TreeItem<T>> call(TableView<TreeItem<T>> p) {
                TreeTableRow row = new TreeTableRow<TreeItem<T>>();
                
                if (row.getDisclosureNode() == null) {
                    final StackPane disclosureNode = new StackPane();
                    disclosureNode.getStyleClass().setAll("tree-disclosure-node");

                    final StackPane disclosureNodeArrow = new StackPane();
                    disclosureNodeArrow.getStyleClass().setAll("arrow");
                    disclosureNode.getChildren().add(disclosureNodeArrow);

                    row.setDisclosureNode(disclosureNode);
                }
                
                row.updateTreeTableView(control);
                row.getStyleClass().add("tree-table-row");
                return row;
            }
        });
        
        getChildren().add(table);
        

        registerChangeListener(control.rootProperty(), "ROOT");
        registerChangeListener(control.showRootProperty(), "SHOW_ROOT");
        registerChangeListener(control.cellFactoryProperty(), "CELL_FACTORY");
        registerChangeListener(control.impl_treeItemCountProperty(), "TREE_ITEM_COUNT");
//        registerChangeListener(control.focusTraversableProperty(), "FOCUS_TRAVERSABLE");
        
        updateItemCount();
    }
    
    @Override protected void handleControlPropertyChanged(String p) {
        super.handleControlPropertyChanged(p);
        
        if (p == "ROOT") {
            setRoot(getSkinnable().getRoot());
        } else if (p == "SHOW_ROOT") {
            // if we turn off showing the root, then we must ensure the root
            // is expanded - otherwise we end up with no visible items in
            // the tree.
            if (! getSkinnable().isShowRoot() && getRoot() != null) {
                 getRoot().setExpanded(true);

                 // update the item count in the flow and behavior instances
                updateItemCount();
            }
        } else if (p == "CELL_FACTORY") {
            // FIXME can't set treeview cell factory in to a table!
        } else if (p == "TREE_ITEM_COUNT") {
            updateItemCount();
//        } else if (p == "FOCUS_TRAVERSABLE") {
//            flow.setFocusTraversable(getSkinnable().isFocusTraversable());
        }
    }
    
    private WeakEventHandler weakRootListener;
    private WeakReference<TreeItem> weakRoot;
    private TreeItem getRoot() {
        return weakRoot == null ? null : weakRoot.get();
    }
    private void setRoot(TreeItem newRoot) {
//        if (getRoot() != null && weakRootListener != null) {
//            getRoot().removeEventHandler(TreeItem.<T>treeNotificationEvent(), weakRootListener);
//        }
        weakRoot = new WeakReference<TreeItem>(newRoot);
//        if (getRoot() != null) {
//            weakRootListener = new WeakEventHandler(getRoot(), TreeItem.<T>treeNotificationEvent(), rootListener);
//            getRoot().addEventHandler(TreeItem.<T>treeNotificationEvent(), weakRootListener);
//        }
    }

    private int getItemCount() {
        return getSkinnable().impl_getTreeItemCount();
    }
    
    private void updateColumns() {
        table.getColumns().setAll(getSkinnable().getColumns());
    }
    
    private void updateItemCount() {
        int size = getItemCount();
        ObservableList<TreeItem<T>> temp = FXCollections.observableArrayList();
        
        for (int i = 0; i < size; i++) {
            temp.add(getSkinnable().getTreeItem(i));
        }
        
        table.setItems(temp);
    }
}