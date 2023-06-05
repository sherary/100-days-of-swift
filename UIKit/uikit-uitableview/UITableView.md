Commonly used properties of UITableView:

1. `delegate`: A property that sets the delegate object for the table view. The delegate receives notifications and can customize the behavior of the table view.

2. `dataSource`: A property that sets the data source object for the table view. The data source provides the table view with the necessary data and manages the cells.

3. `rowHeight`: The height of each row in the table view. You can set a fixed value or use automatic row height calculation with `UITableView.automaticDimension`.

4. `sectionHeaderHeight` and `sectionFooterHeight`: The height of the header and footer views for each section in the table view. You can set a fixed value or use automatic dimension calculation.

5. `separatorStyle`: The style of the separators between the cells in the table view. It can be `.none` (no separators), `.singleLine` (single-line separators), or `.singleLineEtched` (single-line etched separators).

6. `separatorColor`: The color of the separators between the cells in the table view.

7. `backgroundView`: A view that is displayed behind the table view. You can use this property to set a custom background view for the table view.

8. `allowsSelection`: A Boolean value that determines whether the cells in the table view can be selected.

9. `allowsMultipleSelection`: A Boolean value that determines whether multiple cells in the table view can be selected simultaneously.

10. `tableHeaderView` and `tableFooterView`: Views that are displayed at the top and bottom of the table view, respectively.

11. `refreshControl`: A UIRefreshControl object that adds a pull-to-refresh feature to the table view.
