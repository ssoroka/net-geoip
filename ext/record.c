#include "geoip.h"


//
// Net::GeoIP::Record
//

VALUE
geoip_record_alloc(VALUE klass) {
	GeoIPRecordContainer *container;
	
	container = ALLOC(GeoIPRecordContainer);
        container->record = NULL;
	
	return Data_Wrap_Struct(klass, 0, geoip_record_free, container);
}

void
geoip_record_free(GeoIPRecordContainer *container) {
	if (container->record) {
		GeoIPRecord_delete(container->record);
	}
	
	free(container);
	
	return;
}

/*
 * call-seq:
 *   Net::GeoIP::Record.new(database, host)
 *
 * Return a new Record object, using the database specified, for the specified
 * host.  Net::GeoIP::Record instances are usually retrieved by using the
 * index [] operator on a Net::GeoIP database.
 *
 * <code>database</code> should be a Net::GeoIP instance.
 */
VALUE
geoip_record_initialize(VALUE self, VALUE database, VALUE host) {
	GeoIPContainer *geoip_container;
	GeoIPRecordContainer *container;
	
	if (!rb_obj_is_kind_of(database, cGeoIP)) {
		rb_raise(rb_eTypeError, "First argument should be an instance of Net::GeoIP.");
	}
	Check_Type(host, T_STRING);
	
	Data_Get_Struct(database, GeoIPContainer, geoip_container);
	Data_Get_Struct(self, GeoIPRecordContainer, container);
	
	container->record = GeoIP_record_by_name(geoip_container->geoip, RSTRING(host)->ptr);
	
	if (container->record == NULL) {
		rb_raise(cGeoIPRecordNotFoundError, "Record Not Found.");
	}
	
	return self;
}

GEOIP_RECORD_STRING_ACCESSOR(country_code);
GEOIP_RECORD_STRING_ACCESSOR(country_code3);
GEOIP_RECORD_STRING_ACCESSOR(country_name);
GEOIP_RECORD_STRING_ACCESSOR(region);
GEOIP_RECORD_STRING_ACCESSOR(city);
GEOIP_RECORD_STRING_ACCESSOR(postal_code);
GEOIP_RECORD_FLOAT_ACCESSOR(latitude);
GEOIP_RECORD_FLOAT_ACCESSOR(longitude);
GEOIP_RECORD_INT_ACCESSOR(area_code);
GEOIP_RECORD_INT_ACCESSOR(dma_code);
