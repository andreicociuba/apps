###

ownCloud - App Framework

@author Bernhard Posselt
@copyright 2012 Bernhard Posselt nukeawhale@gmail.com

This library is free software; you can redistribute it and/or
modify it under the terms of the GNU AFFERO GENERAL PUBLIC LICENSE
License as published by the Free Software Foundation; either
version 3 of the License, or any later version.

This library is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU AFFERO GENERAL PUBLIC LICENSE for more details.

You should have received a copy of the GNU Affero General Public
License along with this library.  If not, see <http://www.gnu.org/licenses/>.

###


angular.module('OC', []).config ['$httpProvider', ($httpProvider) ->

	# Always send the CSRF token by default
	$httpProvider.defaults.get['requesttoken'] = oc_requesttoken
	$httpProvider.defaults.post['requesttoken'] = oc_requesttoken
	$httpProvider.defaults.put['requesttoken'] = oc_requesttoken
	$httpProvider.defaults.delete['requesttoken'] = oc_requesttoken
	
	# needed because crap PHP does not understand JSON
	$httpProvider.defaults.post['Content-Type'] =
		'application/x-www-form-urlencoded'
		
	$httpProvider.defaults.get['Content-Type'] =
		'application/x-www-form-urlencoded'

	$httpProvider.defaults.transformRequest = (data) ->
		if angular.isUndefined(data)
			return {}
		else
			return $.param(data)
]
