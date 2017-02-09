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
import java.util.regex.Pattern;

public class All_Games_Conversion {

	public static void main(String[] args) {

		// String csvFile =
		// "/Users/jinyongshin/Dropbox/DBFinal/national/list_of_leagues.csv";
		// String csvFile =
		// "/Users/jinyongshin/Dropbox/DBFinal/national/2013-2014 All
		// games/SeriaA.txt";
		BufferedReader br = null;
		String line = "";
		String cvsSplitBy = ",";
		// write in fileString
		String textList = "/Users/jinyongshin/Desktop/Database_Final/AllLeagues/name.txt";
		BufferedReader br_list = null;
		BufferedWriter bw = null;
		try {
			// String Name = "";
			String savedFile = "/Users/jinyongshin/Desktop/Database_Final/AllLeagues/newgames2.sql";
			File file = new File(savedFile);
			FileWriter fw = new FileWriter(file.getAbsoluteFile());
			HashMap<String, Integer> teams = new HashMap<String, Integer>();
			br_list = new BufferedReader(new FileReader(textList));
			bw = new BufferedWriter(fw);
			String Name = "";
			int Season = 2010;
			while ((Name = br_list.readLine()) != null) {
				String csvFile = "/Users/jinyongshin/Desktop/Database_Final/AllLeagues/" + Name;
				br = new BufferedReader(new FileReader(csvFile));
				while ((line = br.readLine()) != null) {
					String[] data = line.split(cvsSplitBy);
					String Home = deAccent(data[2]);
					String Away = deAccent(data[3]);
					int index = data[4].indexOf('-');
					String HomeS = data[4].substring(0, index);
					String AwayS = data[4].substring(index + 1);
					int index2 = data[5].indexOf('-');
					String HomeES = data[5].substring(0, index2);
					String AwayES = data[5].substring(index2 + 1);
//					String outputVal = "INSERT INTO League_Games VALUES ('a001', '" + Season + "', '" + data[1]
//							+ "', \"" + Home + "\", \"" + Away + "\", '" + HomeS + "', '" + AwayS + "', '" + HomeES
//							+ "', '" + AwayES + "'); \n";
					String outputVal = "INSERT INTO League_Games VALUES ('a001', '" + Season + "', '" + data[1]
					+ "', \"" + Home + "\", \"" + Away + "\", '" + HomeS + "', '" + AwayS + "', '" + HomeES
					+ "', '" + AwayES + "'); \n";
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