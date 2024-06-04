// Calculate the number of chunks in both dimensions
var chunkCountX = array_length(global.chunk_data);
var chunkCountY = array_length(global.chunk_data[0]);

// Draw rectangles around each chunk
if (global.extra_info = true) {
	for (var cx = 0; cx < chunkCountX; cx++) {
	    for (var cy = 0; cy < chunkCountY; cy++) {
	        var x1 = cx * global.chunk_size * 8;
	        var y1 = cy * global.chunk_size * 8;
	        var x2 = x1 + global.chunk_size * 8;
	        var y2 = y1 + global.chunk_size * 8;
	        draw_rectangle(x1, y1, x2, y2, true); // Draw outline of the rectangle
	    }
	}
}