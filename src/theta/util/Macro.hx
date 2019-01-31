package theta.util;

import haxe.io.Bytes;
import haxe.macro.Context;
import haxe.Resource;
import haxe.macro.Expr;
import haxe.macro.TypeTools;
import haxe.macro.Type;


class Macro {
	public static var COMPONENT_COUNT = 0;
	public static macro function initComponent ():Array<haxe.macro.Field> {
		var c = Context.getLocalClass().get();		
		var name = c.pack.join('.') + '.' + c.name;
		var last = Resource.getString('components');
		if (last == null) last = '';
		var string = last + ',' + name;
		Context.addResource('components', Bytes.ofString(string));

		var fields = Context.getBuildFields();

		var idx = Resource.getBytes('componentCount');
		if (idx == null) idx = Bytes.alloc(1);

		fields.push({
			name: 'id',
			access: [APublic, AStatic],
			kind: FVar(macro : Int, macro $v{idx.get(0)}),
			pos: Context.currentPos(),
		});

		idx.set(0, idx.get(0) + 1);
		COMPONENT_COUNT = idx.get(0) + 1;

		Context.addResource('componentCount', idx);
		return fields;
	}
}
