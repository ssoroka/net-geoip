#ifndef __RUBY_NET_GEOIP_RECORD_MACROS_H
#define __RUBY_NET_GEOIP_RECORD_MACROS_H

/* Prototype for Net::GeoIP::Record accessors. */
#define GEOIP_RECORD_ACCESSOR_PROTO(name) VALUE geoip_record_##name(VALUE self);

/* Generate the Net::GeoIP::Record accessors. */
#define GEOIP_RECORD_ACCESSOR(name,func) \
VALUE \
geoip_record_##name(VALUE self) { \
	GeoIPRecordContainer *container; \
  Data_Get_Struct(self, GeoIPRecordContainer, container); \
  \
	if (container->record == NULL) return Qnil; \
	\
	return func(container->record->name); \
} \

#define GEOIP_RECORD_STRING_ACCESSOR(name) GEOIP_RECORD_ACCESSOR(name,rb_str_new2)
#define GEOIP_RECORD_FLOAT_ACCESSOR(name) GEOIP_RECORD_ACCESSOR(name,rb_float_new)
#define GEOIP_RECORD_INT_ACCESSOR(name) GEOIP_RECORD_ACCESSOR(name,rb_int_new)

#endif
