<?php

/**
 * BaseAsignacionTrabajadores
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 * 
 * @property integer $user_id
 * @property integer $version_id
 * @property Version $Version
 * @property sfGuardUser $sfGuardUser
 * 
 * @method integer                getUserId()      Returns the current record's "user_id" value
 * @method integer                getVersionId()   Returns the current record's "version_id" value
 * @method Version                getVersion()     Returns the current record's "Version" value
 * @method sfGuardUser            getSfGuardUser() Returns the current record's "sfGuardUser" value
 * @method AsignacionTrabajadores setUserId()      Sets the current record's "user_id" value
 * @method AsignacionTrabajadores setVersionId()   Sets the current record's "version_id" value
 * @method AsignacionTrabajadores setVersion()     Sets the current record's "Version" value
 * @method AsignacionTrabajadores setSfGuardUser() Sets the current record's "sfGuardUser" value
 * 
 * @package    gestor
 * @subpackage model
 * @author     Your name here
 * @version    SVN: $Id: Builder.php 7691 2011-02-04 15:43:29Z jwage $
 */
abstract class BaseAsignacionTrabajadores extends sfDoctrineRecord
{
    public function setTableDefinition()
    {
        $this->setTableName('asignacion_trabajadores');
        $this->hasColumn('user_id', 'integer', null, array(
             'type' => 'integer',
             'primary' => true,
             ));
        $this->hasColumn('version_id', 'integer', null, array(
             'type' => 'integer',
             'primary' => true,
             ));
    }

    public function setUp()
    {
        parent::setUp();
        $this->hasOne('Version', array(
             'local' => 'version_id',
             'foreign' => 'id'));

        $this->hasOne('sfGuardUser', array(
             'local' => 'user_id',
             'foreign' => 'id'));
    }
}