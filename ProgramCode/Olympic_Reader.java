package codingChallenge;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.File;
import java.io.IOException;

public class Olympic_Reader {

	public static void main(String[] args) throws IOException {
		String textList = "/Users/jinyongshin/Dropbox/DBFinal/olympic/csvList";
		BufferedReader br_list = null;
		br_list = new BufferedReader(new FileReader(textList));
		String savedFile = "/Users/jinyongshin/Dropbox/DBFinal/sql_file/Olympic_record.sql";
		File file = new File(savedFile);
		FileWriter fw = new FileWriter(file.getAbsoluteFile());
		BufferedWriter bw = null;
		bw = new BufferedWriter(fw);
		String Name = "";
		while ((Name = br_list.readLine()) != null) {
			String year = Name.substring(0, Name.indexOf('_'));
			String csvFile = "/Users/jinyongshin/Dropbox/DBFinal/olympic/" + Name;
			BufferedReader br = null;
			String line = "";
			String cvsSplitBy = ",";
			// write in file
			br = new BufferedReader(new FileReader(csvFile));
			while ((line = br.readLine()) != null) {
				String[] data = line.split(cvsSplitBy);
				String outputVal = "INSERT INTO Olympic_record VALUES ('" + year + "', '" + data[0] + "', \"" + data[1] + "\", '"
						+ data[2] + "'); \n";
				if (data[0].charAt(0) != 'R') {
					bw.write(outputVal);
				}
				// use comma as separator
			}
			br.close();
		}
		bw.close();
	}

}