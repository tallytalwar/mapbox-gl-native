#import <Foundation/Foundation.h>
#import "MGLTypes.h"

NS_ASSUME_NONNULL_BEGIN

/** These constants represent the scheme that the tile URL templates will use. */
typedef NS_ENUM(NSUInteger, MGLTileSetScheme) {
    MGLTileSetSchemeXYZ = 0,
    MGLTileSetSchemeTMS
};

/**
 The `MGLTileSet` class holds the tile URL template strings and associated
 configuration for those strings. It can be passed to an `MGLVectorSource` or
 `MGLRasterSource` instead of an `NSURL` representing a TileJSON URL to create a 
 source.
 */
@interface MGLTileSet : NSObject

/**
 An `NSArray` of `NSString` objects that represent the tile templates.
 
 Tile URL template strings are a loose open standard for referring to custom
 locations from which to download tiles, whether vector or raster.

 Currently the tokens `x`, `y`, and `z` are supported for tile locations
 in the world grid, as well as `ratio` for use in raster tiles, which allows
 pre-rendered imagery to adapt to the current `UIScreen.scale`.

 Examples:
 
 <ul>
 <li><code>http://abc.com/tiles/{z}/{x}/{y}.pbf</code> might become 
    <code>http://abc.com/tiles/14/6/9.pbf</code></li>
 <li><code>http://abc.com/tiles/{z}/{x}/{y}{ratio}.png</code> might become 
    <code>http://abc.com/tiles/14/6/9@2x.png</code></li>
 </ul>

 Only the first tile URL template string specified is used.

 @see <a href="https://wiki.openstreetmap.org/wiki/Slippy_map_tilenames">OpenStreetMap's
 wiki page</a> for more information on tile URL template strings.
 */
@property (nonatomic, copy) NS_ARRAY_OF(NSString *) *tileURLTemplates;

/**
 An `NSNumber` object containing an integer; specifies the minimum zoom level at 
 which the source will display tiles. The value should be in the range of 0 to 
 22. The default value is 0 and the source will use the default value
 if `minimumZoomLevel` is nil.
 */
@property (nonatomic, nullable) NSNumber *minimumZoomLevel;

/**
 An `NSNumber` object containing an integer; specifies the maximum zoom level at 
 which to display tiles. The value should be in the range of 0 to 22 and greater 
 than `minimumZoomLevel`. The default value is 22 and the source will use the 
 default value if `maximumZoomLevel` is nil.
 */
@property (nonatomic, nullable) NSNumber *maximumZoomLevel;

/**
 An `NSString` object that contains an attribution to be displayed when the map
 is shown to a user. The default value is `nil`.
 */
@property (nonatomic, copy, nullable) NSString *attribution;

/**
 An `MGLTileSetScheme` value that contains an enumeration (either
 `MGLTileSetSchemeXYZ` or `MGLTileSetSchemeTMS`) that influences the y direction 
 of the tile coordinates. The default is `MGLTileSetSchemeXYZ`.
 */
@property (nonatomic) MGLTileSetScheme scheme;

/**
 Initializes and returns a new tile set object.
 
 @param tileURLTemplates An `NSArray` of `NSString` objects that represent the 
    tile templates.
 @return The initialized tile set object.
 */
- (instancetype)initWithTileURLTemplates:(NS_ARRAY_OF(NSString *) *)tileURLTemplates;

/**
 Initializes and returns a new tile set object.
 
 @param tileURLTemplates An `NSArray` of `NSString` objects that represent the 
    tile templates.
 @param minimumZoomLevel An `NSUInteger`; specifies the minimum zoom level at 
    which to display tiles.
 @param maximumZoomLevel An `NSUInteger`; specifies the maximum zoom level at 
    which to display tiles.
 @return The initialized tile set object.
 */
- (instancetype)initWithTileURLTemplates:(NS_ARRAY_OF(NSString *) *)tileURLTemplates minimumZoomLevel:(NSUInteger)minimumZoomLevel maximumZoomLevel:(NSUInteger)maximumZoomLevel;

@end

NS_ASSUME_NONNULL_END
