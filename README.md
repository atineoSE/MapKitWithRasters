# Sample project for MapKit issue when displaying rasters

This is a sample project to reproduce an issue whereby landmark labels in MapKit are displayed even when explicitly disabling them.

When using a `MKTileOverlayRenderer` to draw raster tiles over the map and even with setting `mapView.canReplaceMapContent = true` and `mapView.addOverlay(overlay, level: .aboveLabels)`, the landmark labels are still visible.

In this sample, an area of interest (roughly the country of Spain) is rendered with grey tiles and the areas outside are rendered with a transparent tile.

Note that even in the case of areas covered by solid tiles, the labels are still visible for a split second when zooming in and out, while the tiles are being fetched (see animation below).

![mapkit_tiles_seethrough_labels](/Volumes/DEV/dev/iOS/my projects/MapKitLabelsFeedbackSampleProject/MapKitLabelsFeedbackSampleProject/mapkit_tiles_seethrough_labels.gif)