#import "MGLFeature_Private.h"
#import "MGLShapeCollectionFeature_Private.h"

#import "MGLPointAnnotation.h"
#import "MGLPolyline.h"
#import "MGLPolygon.h"
#import "MGLValueEvaluator.h"

#import "MGLShape_Private.h"
#import "MGLPointCollection_Private.h"
#import "MGLPolyline+MGLAdditions.h"
#import "MGLPolygon+MGLAdditions.h"
#import "NSDictionary+MGLAdditions.h"
#import "NSArray+MGLAdditions.h"

#import "NSExpression+MGLAdditions.h"

#import <mbgl/util/geometry.hpp>
#import <mbgl/style/conversion/geojson.hpp>
#import <mapbox/geometry/feature.hpp>

@interface MGLPointFeature () <MGLFeaturePrivate>
@end

@implementation MGLPointFeature

@synthesize identifier;
@synthesize attributes;

- (instancetype)initWithCoder:(NSCoder *)decoder {
    if ([super initWithCoder:decoder]) {
        NSSet<Class> *identifierClasses = [NSSet setWithArray:@[[NSString class], [NSNumber class]]];
        identifier = [decoder decodeObjectOfClasses:identifierClasses forKey:@"identifier"];
        attributes = [decoder decodeObjectOfClass:[NSDictionary class] forKey:@"attributes"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [super encodeWithCoder:coder];
    [coder encodeObject:identifier forKey:@"identifier"];
    [coder encodeObject:attributes forKey:@"attributes"];
}

- (BOOL)isEqual:(id)other {
    if (other == self) return YES;
    if (![other isKindOfClass:[MGLPointFeature class]]) return NO;
    
    MGLPointFeature *otherPointFeature = other;
    return ([super isEqual:other]
            && ((!self.geoJSONDictionary && !otherPointFeature.geoJSONDictionary) || [self.geoJSONDictionary isEqualToDictionary:otherPointFeature.geoJSONDictionary]));
}

- (NSUInteger)hash {
    return [super hash] + [[self geoJSONDictionary] hash];
}

- (id)attributeForKey:(NSString *)key {
    return self.attributes[key];
}

- (NSDictionary *)geoJSONDictionary {
    return NSDictionaryFeatureForGeometry([super geoJSONDictionary], self.attributes, self.identifier);
}

- (mbgl::Feature)mbglFeature {
    return mbglFeature({[self geometryObject]}, identifier, self.attributes);
}

@end

@interface MGLPolylineFeature () <MGLFeaturePrivate>
@end

@implementation MGLPolylineFeature

@synthesize identifier;
@synthesize attributes;

- (instancetype)initWithCoder:(NSCoder *)decoder {
    if (self = [super initWithCoder:decoder]) {
        NSSet<Class> *identifierClasses = [NSSet setWithArray:@[[NSString class], [NSNumber class]]];
        identifier = [decoder decodeObjectOfClasses:identifierClasses forKey:@"identifier"];
        attributes = [decoder decodeObjectOfClass:[NSDictionary class] forKey:@"attributes"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [super encodeWithCoder:coder];
    [coder encodeObject:identifier forKey:@"identifier"];
    [coder encodeObject:attributes forKey:@"attributes"];
}

- (BOOL)isEqual:(id)other {
    if (other == self) return YES;
    if (![other isKindOfClass:[MGLPolylineFeature class]]) return NO;
    
    MGLPolylineFeature *otherPointFeature = other;
    return ([super isEqual:other]
            && ((!self.geoJSONDictionary && !otherPointFeature.geoJSONDictionary) || [self.geoJSONDictionary isEqualToDictionary:otherPointFeature.geoJSONDictionary]));
}

- (NSUInteger)hash {
    return [super hash] + [[self geoJSONDictionary] hash];
}

- (id)attributeForKey:(NSString *)key {
    return self.attributes[key];
}

- (NSDictionary *)geoJSONDictionary {
    return NSDictionaryFeatureForGeometry([super geoJSONDictionary], self.attributes, self.identifier);
}

- (mbgl::Feature)mbglFeature {
    return mbglFeature({[self geometryObject]}, identifier, self.attributes);
}

@end

@interface MGLPolygonFeature () <MGLFeaturePrivate>
@end

@implementation MGLPolygonFeature

@synthesize identifier;
@synthesize attributes;

- (instancetype)initWithCoder:(NSCoder *)decoder {
    if (self = [super initWithCoder:decoder]) {
        NSSet<Class> *identifierClasses = [NSSet setWithArray:@[[NSString class], [NSNumber class]]];
        identifier = [decoder decodeObjectOfClasses:identifierClasses forKey:@"identifier"];
        attributes = [decoder decodeObjectOfClass:[NSDictionary class] forKey:@"attributes"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [super encodeWithCoder:coder];
    [coder encodeObject:identifier forKey:@"identifier"];
    [coder encodeObject:attributes forKey:@"attributes"];
}

- (BOOL)isEqual:(id)other {
    if (other == self) return YES;
    if (![other isKindOfClass:[MGLPolygonFeature class]]) return NO;
    
    MGLPolygonFeature *otherPointFeature = other;
    return ([super isEqual:other]
            && ((!self.geoJSONDictionary && !otherPointFeature.geoJSONDictionary) || [self.geoJSONDictionary isEqualToDictionary:otherPointFeature.geoJSONDictionary]));
}

- (NSUInteger)hash {
    return [super hash] + [[self geoJSONDictionary] hash];
}

- (id)attributeForKey:(NSString *)key {
    return self.attributes[key];
}

- (NSDictionary *)geoJSONDictionary {
    return NSDictionaryFeatureForGeometry([super geoJSONDictionary], self.attributes, self.identifier);
}

- (mbgl::Feature)mbglFeature {
    return mbglFeature({[self geometryObject]}, identifier, self.attributes);
}

@end

@interface MGLPointCollectionFeature () <MGLFeaturePrivate>
@end

@implementation MGLPointCollectionFeature

@synthesize identifier;
@synthesize attributes;

- (instancetype)initWithCoder:(NSCoder *)decoder {
    if (self = [super initWithCoder:decoder]) {
        NSSet<Class> *identifierClasses = [NSSet setWithArray:@[[NSString class], [NSNumber class]]];
        identifier = [decoder decodeObjectOfClasses:identifierClasses forKey:@"identifier"];
        attributes = [decoder decodeObjectOfClass:[NSDictionary class] forKey:@"attributes"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [super encodeWithCoder:coder];
    [coder encodeObject:identifier forKey:@"identifier"];
    [coder encodeObject:attributes forKey:@"attributes"];
}

- (BOOL)isEqual:(id)other {
    if (other == self) return YES;
    if (![other isKindOfClass:[MGLPointCollectionFeature class]]) return NO;
    
    MGLPointCollectionFeature *otherPointFeature = other;
    return ([super isEqual:other]
            && ((!self.geoJSONDictionary && !otherPointFeature.geoJSONDictionary) || [self.geoJSONDictionary isEqualToDictionary:otherPointFeature.geoJSONDictionary]));
}

- (NSUInteger)hash {
    return [super hash] + [[self geoJSONDictionary] hash];
}

- (id)attributeForKey:(NSString *)key {
    return self.attributes[key];
}

- (NSDictionary *)geoJSONDictionary {
    return NSDictionaryFeatureForGeometry([super geoJSONDictionary], self.attributes, self.identifier);
}

- (mbgl::Feature)mbglFeature {
    return mbglFeature({[self geometryObject]}, identifier, self.attributes);
}

@end

@interface MGLMultiPolylineFeature () <MGLFeaturePrivate>
@end

@implementation MGLMultiPolylineFeature

@synthesize identifier;
@synthesize attributes;

- (instancetype)initWithCoder:(NSCoder *)decoder {
    if (self = [super initWithCoder:decoder]) {
        NSSet<Class> *identifierClasses = [NSSet setWithArray:@[[NSString class], [NSNumber class]]];
        identifier = [decoder decodeObjectOfClasses:identifierClasses forKey:@"identifier"];
        attributes = [decoder decodeObjectOfClass:[NSDictionary class] forKey:@"attributes"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [super encodeWithCoder:coder];
    [coder encodeObject:identifier forKey:@"identifier"];
    [coder encodeObject:attributes forKey:@"attributes"];
}

- (BOOL)isEqual:(id)other {
    if (other == self) return YES;
    if (![other isKindOfClass:[MGLMultiPolylineFeature class]]) return NO;
    
    MGLMultiPolylineFeature *otherMultiPolylineFeature = other;
    return ([super isEqual:other]
            && ((!self.geoJSONDictionary && !otherMultiPolylineFeature.geoJSONDictionary)
                || [self.geoJSONDictionary isEqualToDictionary:otherMultiPolylineFeature.geoJSONDictionary]));
}

- (NSUInteger)hash {
    return [super hash] + [[self geoJSONDictionary] hash];
}

- (id)attributeForKey:(NSString *)key {
    return self.attributes[key];
}

- (NSDictionary *)geoJSONDictionary {
    return NSDictionaryFeatureForGeometry([super geoJSONDictionary], self.attributes, self.identifier);
}

- (mbgl::Feature)mbglFeature {
    return mbglFeature({[self geometryObject]}, identifier, self.attributes);
}

@end

@interface MGLMultiPolygonFeature () <MGLFeaturePrivate>
@end

@implementation MGLMultiPolygonFeature

@synthesize identifier;
@synthesize attributes;

- (instancetype)initWithCoder:(NSCoder *)decoder {
    if (self = [super initWithCoder:decoder]) {
        NSSet<Class> *identifierClasses = [NSSet setWithArray:@[[NSString class], [NSNumber class]]];
        identifier = [decoder decodeObjectOfClasses:identifierClasses forKey:@"identifier"];
        attributes = [decoder decodeObjectOfClass:[NSDictionary class] forKey:@"attributes"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [super encodeWithCoder:coder];
    [coder encodeObject:identifier forKey:@"identifier"];
    [coder encodeObject:attributes forKey:@"attributes"];
}

- (BOOL)isEqual:(id)other {
    if (other == self) return YES;
    if (![other isKindOfClass:[MGLMultiPolygonFeature class]]) return NO;
    
    MGLMultiPolygonFeature *otherMultiPolygonFeature = other;
    return ([super isEqual:other]
            && ((!self.geoJSONDictionary && !otherMultiPolygonFeature.geoJSONDictionary)
                || [self.geoJSONDictionary isEqualToDictionary:otherMultiPolygonFeature.geoJSONDictionary]));
}

- (NSUInteger)hash {
    return [super hash] + [[self geoJSONDictionary] hash];
}

- (id)attributeForKey:(NSString *)key {
    return self.attributes[key];
}

- (NSDictionary *)geoJSONDictionary {
    return NSDictionaryFeatureForGeometry([super geoJSONDictionary], self.attributes, self.identifier);
}

- (mbgl::Feature)mbglFeature {
    return mbglFeature({[self geometryObject]}, identifier, self.attributes);
}

@end

@interface MGLShapeCollectionFeature () <MGLFeaturePrivate>
@end

@implementation MGLShapeCollectionFeature

@synthesize identifier;
@synthesize attributes;

@dynamic shapes;

+ (instancetype)shapeCollectionWithShapes:(NSArray *)shapes {
    return [super shapeCollectionWithShapes:shapes];
}

- (instancetype)initWithCoder:(NSCoder *)decoder {
    if (self = [super initWithCoder:decoder]) {
        NSSet<Class> *identifierClasses = [NSSet setWithArray:@[[NSString class], [NSNumber class]]];
        identifier = [decoder decodeObjectOfClasses:identifierClasses forKey:@"identifier"];
        attributes = [decoder decodeObjectOfClass:[NSDictionary class] forKey:@"attributes"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [super encodeWithCoder:coder];
    [coder encodeObject:identifier forKey:@"identifier"];
    [coder encodeObject:attributes forKey:@"attributes"];
}

- (BOOL)isEqual:(id)other {
    if (other == self) return YES;
    if (![other isKindOfClass:[MGLShapeCollectionFeature class]]) return NO;
    
    MGLShapeCollectionFeature *otherShapeCollectionFeature = other;
    return ([super isEqual:other]
            && ((!self.geoJSONDictionary && !otherShapeCollectionFeature.geoJSONDictionary)
                || [self.geoJSONDictionary isEqualToDictionary:otherShapeCollectionFeature.geoJSONDictionary]));
}

- (NSUInteger)hash {
    return [super hash] + [[self geoJSONDictionary] hash];
}

- (id)attributeForKey:(NSString *)key {
    return self.attributes[key];
}

- (NSDictionary *)geoJSONDictionary {
    return NSDictionaryFeatureForGeometry([super geoJSONDictionary], self.attributes, self.identifier);
}

- (mbgl::Feature)mbglFeature {
    [NSException raise:@"Method unavailable" format:@"%s is not available on %@.", __PRETTY_FUNCTION__, [self class]];
    mbgl::Polygon<double> geometry;
    return mbgl::Feature{geometry};
}

- (mbgl::FeatureCollection)mbglFeatureCollection {
    mbgl::FeatureCollection featureCollection;
    featureCollection.reserve(self.shapes.count);
    for (id <MGLFeaturePrivate> feature in self.shapes) {
        featureCollection.push_back([feature mbglFeature]);
    }
    return featureCollection;
}

@end

/**
 Transforms an `mbgl::geometry::geometry` type into an instance of the
 corresponding Objective-C geometry class.
 */
template <typename T>
class GeometryEvaluator {
public:
    MGLShape <MGLFeaturePrivate> * operator()(const mbgl::Point<T> &geometry) const {
        MGLPointFeature *feature = [[MGLPointFeature alloc] init];
        feature.coordinate = toLocationCoordinate2D(geometry);
        return feature;
    }
    
    MGLShape <MGLFeaturePrivate> * operator()(const mbgl::LineString<T> &geometry) const {
        std::vector<CLLocationCoordinate2D> coordinates = toLocationCoordinates2D(geometry);
        return [MGLPolylineFeature polylineWithCoordinates:&coordinates[0] count:coordinates.size()];
    }
    
    MGLShape <MGLFeaturePrivate> * operator()(const mbgl::Polygon<T> &geometry) const {
        return toShape<MGLPolygonFeature>(geometry);
    }
    
    MGLShape <MGLFeaturePrivate> * operator()(const mbgl::MultiPoint<T> &geometry) const {
        std::vector<CLLocationCoordinate2D> coordinates = toLocationCoordinates2D(geometry);
        return [[MGLPointCollectionFeature alloc] initWithCoordinates:&coordinates[0] count:coordinates.size()];
    }
    
    MGLShape <MGLFeaturePrivate> * operator()(const mbgl::MultiLineString<T> &geometry) const {
        NSMutableArray *polylines = [NSMutableArray arrayWithCapacity:geometry.size()];
        for (auto &lineString : geometry) {
            std::vector<CLLocationCoordinate2D> coordinates = toLocationCoordinates2D(lineString);
            MGLPolyline *polyline = [MGLPolyline polylineWithCoordinates:&coordinates[0] count:coordinates.size()];
            [polylines addObject:polyline];
        }
        
        return [MGLMultiPolylineFeature multiPolylineWithPolylines:polylines];
    }
    
    MGLShape <MGLFeaturePrivate> * operator()(const mbgl::MultiPolygon<T> &geometry) const {
        NSMutableArray *polygons = [NSMutableArray arrayWithCapacity:geometry.size()];
        for (auto &polygon : geometry) {
            [polygons addObject:toShape(polygon)];
        }
        
        return [MGLMultiPolygonFeature multiPolygonWithPolygons:polygons];
    }
    
    MGLShape <MGLFeaturePrivate> * operator()(const mapbox::geometry::geometry_collection<T> &collection) const {
        NSMutableArray *shapes = [NSMutableArray arrayWithCapacity:collection.size()];
        for (auto &geometry : collection) {
            // This is very much like the transformation that happens in MGLFeaturesFromMBGLFeatures(), but these are raw geometries with no associated feature IDs or attributes.
            MGLShape <MGLFeaturePrivate> *shape = mapbox::geometry::geometry<T>::visit(geometry, *this);
            [shapes addObject:shape];
        }
        return [MGLShapeCollectionFeature shapeCollectionWithShapes:shapes];
    }
    
private:
    static CLLocationCoordinate2D toLocationCoordinate2D(const mbgl::Point<T> &point) {
        return CLLocationCoordinate2DMake(point.y, point.x);
    }
    
    static std::vector<CLLocationCoordinate2D> toLocationCoordinates2D(const std::vector<mbgl::Point<T>> &points) {
        std::vector<CLLocationCoordinate2D> coordinates;
        coordinates.reserve(points.size());
        std::transform(points.begin(), points.end(), std::back_inserter(coordinates), toLocationCoordinate2D);
        return coordinates;
    }
    
    template<typename U = MGLPolygon>
    static U *toShape(const mbgl::Polygon<T> &geometry) {
        auto &linearRing = geometry.front();
        std::vector<CLLocationCoordinate2D> coordinates = toLocationCoordinates2D(linearRing);
        NSMutableArray *innerPolygons;
        if (geometry.size() > 1) {
            innerPolygons = [NSMutableArray arrayWithCapacity:geometry.size() - 1];
            for (auto iter = geometry.begin() + 1; iter != geometry.end(); iter++) {
                auto &innerRing = *iter;
                std::vector<CLLocationCoordinate2D> coordinates = toLocationCoordinates2D(innerRing);
                MGLPolygon *innerPolygon = [MGLPolygon polygonWithCoordinates:&coordinates[0] count:coordinates.size()];
                [innerPolygons addObject:innerPolygon];
            }
        }
        
        return [U polygonWithCoordinates:&coordinates[0] count:coordinates.size() interiorPolygons:innerPolygons];
    }
};

template <typename T>
class GeoJSONEvaluator {
public:
    MGLShape <MGLFeaturePrivate> * operator()(const mbgl::Geometry<T> &geometry) const {
        GeometryEvaluator<T> evaluator;
        MGLShape <MGLFeaturePrivate> *shape = mapbox::geometry::geometry<T>::visit(geometry, evaluator);
        return shape;
    }
    
    MGLShape <MGLFeaturePrivate> * operator()(const mbgl::Feature &feature) const {
        MGLShape <MGLFeaturePrivate> *shape = (MGLShape <MGLFeaturePrivate> *)MGLFeatureFromMBGLFeature(feature);
        return shape;
    }
    
    MGLShape <MGLFeaturePrivate> * operator()(const mbgl::FeatureCollection &collection) const {
        NSMutableArray *shapes = [NSMutableArray arrayWithCapacity:collection.size()];
        for (const auto &feature : collection) {
            [shapes addObject:MGLFeatureFromMBGLFeature(feature)];
        }
        return [MGLShapeCollection<MGLFeaturePrivate> shapeCollectionWithShapes:shapes];
    }
};

NS_ARRAY_OF(MGLShape <MGLFeature> *) *MGLFeaturesFromMBGLFeatures(const std::vector<mbgl::Feature> &features) {
    NSMutableArray *shapes = [NSMutableArray arrayWithCapacity:features.size()];
    for (const auto &feature : features) {
        [shapes addObject:MGLFeatureFromMBGLFeature(feature)];
    }
    return shapes;
}

id <MGLFeature> MGLFeatureFromMBGLFeature(const mbgl::Feature &feature) {
    NSMutableDictionary *attributes = [NSMutableDictionary dictionaryWithCapacity:feature.properties.size()];
    for (auto &pair : feature.properties) {
        auto &value = pair.second;
        ValueEvaluator evaluator;
        attributes[@(pair.first.c_str())] = mbgl::Value::visit(value, evaluator);
    }
    GeometryEvaluator<double> evaluator;
    MGLShape <MGLFeaturePrivate> *shape = mapbox::geometry::geometry<double>::visit(feature.geometry, evaluator);
    if (feature.id) {
        shape.identifier = mbgl::FeatureIdentifier::visit(*feature.id, ValueEvaluator());
    }
    shape.attributes = attributes;
    
    return shape;
}

MGLShape* MGLShapeFromGeoJSON(const mapbox::geojson::geojson &geojson) {
    GeoJSONEvaluator<double> evaluator;
    MGLShape *shape = mapbox::geojson::geojson::visit(geojson, evaluator);
    return shape;
}

mbgl::Feature mbglFeature(mbgl::Feature feature, id identifier, NSDictionary *attributes)
{
    if (identifier) {
        NSExpression *identifierExpression = [NSExpression expressionForConstantValue:identifier];
        feature.id = [identifierExpression mgl_featureIdentifier];
    }
    feature.properties = [attributes mgl_propertyMap];
    return feature;
}

NS_DICTIONARY_OF(NSString *, id) *NSDictionaryFeatureForGeometry(NSDictionary *geometry, NSDictionary *attributes, id identifier) {
    NSMutableDictionary *feature = [@{@"type": @"Feature",
                                      @"properties": (attributes) ?: [NSNull null],
                                      @"geometry": geometry} mutableCopy];
    feature[@"id"] = identifier;
    return [feature copy];
}
