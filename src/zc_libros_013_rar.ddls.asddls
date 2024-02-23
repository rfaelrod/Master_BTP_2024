@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Libros, C de Consumption'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true
define view entity zc_libros_013_rar
  as select from    ztb_libros_013       as Libros
    inner join      ztb_catego_013       as Categorias on Libros.bi_categ = Categorias.bi_categ
    left outer join zc_clnts_lib_013_rar as Ventas     on Libros.id_libro = Ventas.IdLibro
  association [0..*] to zc_clientes_013_rar as _Clientes on $projection.IdLibro = _Clientes.IdLibro
{
  key Libros.id_libro     as IdLibro,
      Categorias.bi_categ as Categoria,
      Libros.titulo       as Titulo,
      Libros.autor        as Autor,
      Libros.editorial    as Editorial,
      Libros.idioma       as Idioma,
      Libros.paginas      as Paginas,
      @Semantics.amount.currencyCode: 'Moneda'
      Libros.precio       as Precio,
      Libros.moneda       as Moneda,

      case
        when Ventas.Ventas < 1 then 0
        when Ventas.Ventas >= 1 and Ventas.Ventas < 2 then 1
        when Ventas.Ventas >= 2 and Ventas.Ventas < 3 then 2
        else 3
      end                 as Ventas,

      case Ventas.Ventas
          when 0 then 'Cero'
          else 'No cero'
       end                as Text,

      Libros.formato      as Formato,
      Libros.url          as Imagen,
      _Clientes
}
