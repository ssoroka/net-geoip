#ifndef __RUBY_NET_GEOIP_H
#define __RUBY_NET_GEOIP_H

#include <stdlib.h>
#include <stdio.h>

#include <ruby.h>

#include <GeoIP.h>
#include <GeoIPCity.h>

#include "record_macros.h"


extern VALUE cGeoIP;
extern VALUE cGeoIPRecord;
extern VALUE cGeoIPError;
extern VALUE cGeoIPRecordNotFoundError;


typedef struct _geoip_container {
	GeoIP *geoip;
} GeoIPContainer;

typedef struct _geoip_record_container {
	GeoIPRecord *record;
} GeoIPRecordContainer;

/* Net::GeoIP */
extern VALUE geoip_alloc(VALUE klass);
extern void geoip_free(GeoIPContainer *p);
extern VALUE geoip_initialize(VALUE self, VALUE database);
extern VALUE geoip_index(VALUE self, VALUE index);
extern VALUE geoip_database_info(VALUE self);
extern VALUE geoip_open_type(VALUE self, VALUE type, VALUE flags);
extern VALUE geoip_country_code_by_addr( VALUE self, VALUE addr );
extern VALUE geoip_country_code_by_name( VALUE self, VALUE hostname );
extern VALUE geoip_country_code3_by_addr( VALUE self, VALUE addr );
extern VALUE geoip_country_code3_by_name( VALUE self, VALUE hostname );
extern VALUE geoip_country_name_by_addr( VALUE self, VALUE addr );
extern VALUE geoip_country_name_by_name( VALUE self, VALUE hostname );
extern VALUE geoip_name_by_name( VALUE self, VALUE host );
extern VALUE geoip_name_by_addr( VALUE self, VALUE addr );


/* Net::GeoIP::Record */
extern VALUE geoip_record_alloc(VALUE klass);
extern void geoip_record_free(GeoIPRecordContainer *container);
extern VALUE geoip_record_initialize(VALUE self, VALUE database, VALUE host);
extern GEOIP_RECORD_ACCESSOR_PROTO(country_code);
extern GEOIP_RECORD_ACCESSOR_PROTO(country_code3);
extern GEOIP_RECORD_ACCESSOR_PROTO(country_name);
extern GEOIP_RECORD_ACCESSOR_PROTO(region);
extern GEOIP_RECORD_ACCESSOR_PROTO(city);
extern GEOIP_RECORD_ACCESSOR_PROTO(postal_code);
extern GEOIP_RECORD_ACCESSOR_PROTO(latitude);
extern GEOIP_RECORD_ACCESSOR_PROTO(longitude);
extern GEOIP_RECORD_ACCESSOR_PROTO(area_code);
extern GEOIP_RECORD_ACCESSOR_PROTO(dma_code);

/* Initialize the extension. */
extern void Init_geoip();

#endif
