#import "MGLShape.h"

#import <mbgl/util/geometry.hpp>
#import <mbgl/util/geo.hpp>

bool compareByCoordinate(CLLocationCoordinate2D lhs, CLLocationCoordinate2D rhs);

bool operator!=(const CLLocationCoordinate2D lhs, const CLLocationCoordinate2D rhs);

bool operator==(std::vector<CLLocationCoordinate2D>& lhs, std::vector<CLLocationCoordinate2D>& rhs);

@interface MGLShape (Private)

/**
 Returns an `mbgl::Geometry<double>` representation of the `MGLShape`.
 */
- (mbgl::Geometry<double>)geometryObject;

/**
 Returns a dictionary with the GeoJSON geometry member object.
 */
- (NSDictionary *)geoJSONDictionary;

@end
