<?php

/**
 * BaseRelaciones
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 * 
 * @property integer $padre_id
 * @property integer $hijo_id
 * @property Artefacto $Hijos
 * @property Artefacto $Padres
 * 
 * @method integer    getPadreId()  Returns the current record's "padre_id" value
 * @method integer    getHijoId()   Returns the current record's "hijo_id" value
 * @method Artefacto  getHijos()    Returns the current record's "Hijos" value
 * @method Artefacto  getPadres()   Returns the current record's "Padres" value
 * @method Relaciones setPadreId()  Sets the current record's "padre_id" value
 * @method Relaciones setHijoId()   Sets the current record's "hijo_id" value
 * @method Relaciones setHijos()    Sets the current record's "Hijos" value
 * @method Relaciones setPadres()   Sets the current record's "Padres" value
 * 
 * @package    gestor
 * @subpackage model
 * @author     Your name here
 * @version    SVN: $Id: Builder.php 7691 2011-02-04 15:43:29Z jwage $
 */
abstract class BaseRelaciones extends sfDoctrineRecord
{
    public function setTableDefinition()
    {
        $this->setTableName('relaciones');
        $this->hasColumn('padre_id', 'integer', null, array(
             'type' => 'integer',
             'primary' => true,
             ));
        $this->hasColumn('hijo_id', 'integer', null, array(
             'type' => 'integer',
             'primary' => true,
             ));
    }

    public function setUp()
    {
        parent::setUp();
        $this->hasOne('Artefacto as Hijos', array(
             'local' => 'padre_id',
             'foreign' => 'id'));

        $this->hasOne('Artefacto as Padres', array(
             'local' => 'hijo_Id',
             'foreign' => 'id'));
    }
}