@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Clientes'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true
define view entity zc_clientes_013_rar
  as select from ztb_clientes_013 as Clientes
    inner join   ztb_clnts_lib_13 as RelCliLib on RelCliLib.id_cliente = Clientes.id_cliente

{
  key RelCliLib.id_libro   as IdLibro,
  key Clientes.id_cliente  as IdCliente,
  key Clientes.tipo_acceso as TipoAcceso,
      Clientes.nombre      as Nombre,
      Clientes.apellidos   as Apellidos,
      Clientes.email       as Email,
      Clientes.url         as Imagen, 
      concat_with_space( Clientes.nombre, Clientes.apellidos, 2 ) as NombreCompleto
}
