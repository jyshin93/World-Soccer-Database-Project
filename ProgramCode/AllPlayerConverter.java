package codingChallenge;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.File;
import java.io.IOException;
import java.text.Normalizer;
import java.util.HashMap;
import java.util.Scanner;
import java.util.regex.Pattern;

public class AllPlayerConverter {

	public static void main(String[] args) {

		BufferedReader br = null;
		String line = "";
		String cvsSplitBy = ",";
		// write in fileString
		String textList = "/Users/jinyongshin/Desktop/Database_Final/AllPlayers/name.txt";
		BufferedReader br_list = null;
		BufferedWriter bw = null;
		try {
			String savedFile = "/Users/jinyongshin/Desktop/Database_Final/AllPlayers/newBund.sql";
			File file = new File(savedFile);
			FileWriter fw = new FileWriter(file.getAbsoluteFile());
			br_list = new BufferedReader(new FileReader(textList));
			bw = new BufferedWriter(fw);
			String Name = "";
			while ((Name = br_list.readLine()) != null) {
				String csvFile = "/Users/jinyongshin/Desktop/Database_Final/AllPlayers/" + Name;
				br = new BufferedReader(new FileReader(csvFile));
				while ((line = br.readLine()) != null) {
					String[] data = line.split(cvsSplitBy);
					String Season = data[0];
					String LID = data[1];
					String Team = deAccent(data[2]);
					String num = data[3];
					String player = deAccent(data[4]);
					String nation = data[5];
					String position = data[6];
					String weight = data[7];
					String height = data[8];
					String date = "";
					if (data[9].length() > 0) {
						int index1 = data[9].indexOf('-');
						String dd = data[9].substring(0, index1);
						if (dd.length() == 1) {
							dd = "0" + dd;
						}
						int index2 = data[9].substring(index1 + 1).indexOf('-');
						String mm = data[9].substring(index1 + 1, index1 + index2 + 1);
						if (mm.length() == 1) {
							mm = "0" + mm;
						}
						String yy = data[9].substring(index1 + index2 + 2);
						date = "19" + yy + "-" + mm + "-" + dd;
					}
					String outputVal = "INSERT INTO League_squad VALUES ('" + Season + "', '" + LID + "', \"" + Team
							+ "\", '" + num + "', \"" + player + "\", '" + nation + "', '" + position + "', '" + weight
							+ "', '" + height + "', '" + date + "'); \n";
					bw.write(outputVal);
				}
			}

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

	public static String deAccent(String str) {
		String nfdNormalizedString = Normalizer.normalize(str, Normalizer.Form.NFD);
		Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
		return pattern.matcher(nfdNormalizedString).replaceAll("");
	}

}