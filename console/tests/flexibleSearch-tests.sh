./hybrisFlexibleSearch.sh -b "select count({code}),{C:id},{CV:version} from {Media as c}, {CatalogVersion as CV}, {Catalog as C} where {catalogversion}={CV:PK} AND {CV:catalog}={C:PK} AND ({C:id}='china' and {CV:version} like '%Test%') and {pk} IN ({{
 select {target} from {Product2MediaRelation} }})"
./hybrisFlexibleSearch.sh -q "select {pk} from {Product}" > testresults/flexiblesearch/allProducts.tsv
./hybrisFlexibleSearch.sh -i Product > testresults/flexiblesearch/allProducts.tsv
./hybrisFlexibleSearch.sh -i Product -of CSV > testresults/flexiblesearch/allProducts.csv
./hybrisFlexibleSearch.sh -i Product -of CON > testresults/flexiblesearch/allProducts.txt
./hybrisFlexibleSearch.sh -i Product -of BRD > testresults/flexiblesearch/allProducts.brd
./hybrisFlexibleSearch.sh -i Product -mr 5 > testresults/flexiblesearch/first5products
./hybrisFlexibleSearch.sh -cn apparelProductCatalog -cv Staged -i Product -mr 5 > testresults/flexiblesearch/first5products-apparel-staged
./hybrisFlexibleSearch.sh -i Product -mr 2 -fields comments,creationtime,itemtype,modifiedtime,owner,pk,Europe1PriceFactory_PDG,Europe1PriceFactory_PPG,Europe1PriceFactory_PTG,approvalStatus,articleStatus,averageRating,barcodes,buyerIDS,catalogVersion,classificationClasses,code,contentUnit,data_sheet,deliveryModes,deliveryTime,description,detail,ean,endLineNumber,erpGroupBuyer,erpGroupSupplier,europe1Discounts,europe1Prices,europe1Taxes,features,galleryImages,keywords,linkComponents,logo,manufacturerAID,manufacturerName,manufacturerTypeDescription,maxOrderQuantity,minOrderQuantity,name,normal,numberContentUnits,numberOfReviews,offlineDate,onlineDate,order,orderQuantityInterval,others,picture,priceQuantity,productCarouselComponents,productDetailComponents,productFeatureComponents,productListComponents,productOrderLimit,productReferences,productReviews,promotions,remarks > testresults/flexiblesearch/first2products-all-fields.tsv
./hybrisFlexibleSearch.sh -i Product -mr 2 -of BRD -fields comments,creationtime,itemtype,modifiedtime,owner,pk,Europe1PriceFactory_PDG,Europe1PriceFactory_PPG,Europe1PriceFactory_PTG,approvalStatus,articleStatus,averageRating,barcodes,buyerIDS,catalogVersion,classificationClasses,code,contentUnit,data_sheet,deliveryModes,deliveryTime,description,detail,ean,endLineNumber,erpGroupBuyer,erpGroupSupplier,europe1Discounts,europe1Prices,europe1Taxes,features,galleryImages,keywords,linkComponents,logo,manufacturerAID,manufacturerName,manufacturerTypeDescription,maxOrderQuantity,minOrderQuantity,name,normal,numberContentUnits,numberOfReviews,offlineDate,onlineDate,order,orderQuantityInterval,others,picture,priceQuantity,productCarouselComponents,productDetailComponents,productFeatureComponents,productListComponents,productOrderLimit,productReferences,productReviews,promotions,remarks > testresults/flexiblesearch/first2products-all-fields.brd
A=`./hybrisFlexibleSearch.sh -i Product -mr 1 -f pk -of BRD | grep "pk:" | perl -npe "s/pk: //g" | perl -npe "s/[\n\r]+//g"`
./hybrisFlexibleSearch.sh -pk $A -f pk,code,name > tests/flexiblesearch/product-by-pk 