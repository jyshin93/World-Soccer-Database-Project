package codingChallenge;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Random;

public class ValidationSet {
	public static void main(String[] args) {

		// String csvFile =
		// "/Users/jinyongshin/Dropbox/DBFinal/national/list_of_leagues.csv";
		String csvFile = "/Users/jinyongshin/Downloads/Social_Dating_Data.txt";
		BufferedReader br = null;
		String line = "";
		String cvsSplitBy = ",";
		// write in file
		BufferedWriter bw = null;
		try {
			// String savedFile =
			// "/Users/jinyongshin/Dropbox/DBFinal/sql_file/League_list.sql";
			String savedFile = "/Users/jinyongshin/Desktop/Machine Learning/date.train";
			File file = new File(savedFile);
			FileWriter fw = new FileWriter(file.getAbsoluteFile());
			bw = new BufferedWriter(fw);

			br = new BufferedReader(new FileReader(csvFile));
			ArrayList<String> storage = new ArrayList<String>();
			while ((line = br.readLine()) != null) {
				storage.add(line);
				// String outputVal = "INSERT INTO League_list VALUES ('" +
				// data[0] + "', '" + data[1] + "', '" + data[2]
				// + "', '" + data[3] + "', '" + data[4] + "', '" + data[5] +
				// "', '" + data[6] + "'); \n";
//				bw.write(outputVal);
				// use comma as separator
			}
			Random rand = new Random(10);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (br != null) {
				try {
					br.close();
					bw.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}

	}
}
