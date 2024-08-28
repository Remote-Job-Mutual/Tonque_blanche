<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;

class RolesAndPermissionsSeeder extends Seeder
{
    public function run()
    {
        // Reset cached roles and permissions
        app()[\Spatie\Permission\PermissionRegistrar::class]->forgetCachedPermissions();

        // Create permissions
        Permission::create(['name' => 'manage users']);
        Permission::create(['name' => 'manage restaurants']);
        Permission::create(['name' => 'view orders']);

        // Create roles and assign created permissions

        // Super Admin Role
        $role = Role::create(['name' => 'super-admin']);
        $role->givePermissionTo(Permission::all());

        // Admin Role
        $role = Role::create(['name' => 'admin']);
        $role->givePermissionTo(['manage users', 'manage restaurants']);

        // User Role
        $role = Role::create(['name' => 'customer']);
        $role->givePermissionTo('view orders');
    }
}
