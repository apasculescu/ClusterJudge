\name{entities_attribute_stats}
\alias{entities_attribute_stats}
\title{
    presents basic statistics on the number of entities per attribute
  
}
\description{
    Plots the denisty distribution of the number of entities per attribute
    and shows what is the number of attributes proposed to be igonored
    (and the number of attributes that will be kept)
}
\usage{
entities_attribute_stats(entity.attribute
        , min.entities.per.attr = NULL
        , entity.space.name = "Yeast genes"
        , attribute.space.name = "Gene Ontology"
        , plot.saveRDS.file=NULL)
}
\arguments{
    \item{entity.attribute}{
    data frame or matrix with 2 columns 
	The assumption is that first column represent some `entities` like gene names or gene ids. 
    And the second column represents `attributes` of entities (for example Gene Ontology ID 'GO:0007260' 
    which is `tyrosine phosphorylation of STAT protein`)
}
    \item{min.entities.per.attr}{
    a number : the minimum number of entities per attribute accepted

}
    \item{entity.space.name}{
    a string that will be presented on the plot representing the meaning of the entities
}
    \item{attribute.space.name}{
    a string that will be presented on the plot representing the meaning of the attributes
}
    \item{plot.saveRDS.file}{
    if not NULL must be a string represented a file location where the plot will be saved as an RDS object.
    The plot can be then retrieved at any time using readRDS function.
}

}
\details{
    The attributes that appear only on once or just a in very few entities do not bring 
    additional information. In general there are many such `non-informative` attributes.
    Thus it's good to know the proportion of attributes that will be still kept if we impose
    a minimum number of entities per attribute.    
}
\value{
    a number: wich is either the input value of the min.entities.per.attr or,
    in case min.entities.per.attr is null, a proposed min.entities.per.attr threshold.
    The assumption is that attributes characterizing juts one entity are the most frequent.
    The proposed threshold is the minimum number of entities per attribute whose
    frequency matches 1/3 of the above maximum frequency.   
}
\references{
    Gibbons, F.D. and Roth F.P., (2002)
    Judging the Quality of Gene Expression-Based Clustering Methods Using Gene Annotation. 
    Genome Research, vol. 12, pp1574-1581.
}
\author{
    Adrian Pasculescu
}
\examples{
data(Yeast.GO.assocs)
min.entities.per.attr  <- entities_attribute_stats(entity.attribute= Yeast.GO.assocs
                                                  , min.entities.per.attr=NULL
                                                  , entity.space.name='Yeast genes'
                                                  , attribute.space.name='Gene Ontology') 

}
