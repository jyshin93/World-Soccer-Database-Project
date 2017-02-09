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

public class Standing_Conversion {

	public static void main(String[] args) {

		BufferedReader br = null;
		String line = "";
		String cvsSplitBy = ",";
		// write in fileString
		String textList = "/Users/jinyongshin/Desktop/Database_Final/AllLeagues/name.txt";
		BufferedReader br_list = null;
		BufferedWriter bw = null;
		try {
			String savedFile = "/Users/jinyongshin/Desktop/Database_Final/AllLeagues/newstand3.sql";
			File file = new File(savedFile);
			FileWriter fw = new FileWriter(file.getAbsoluteFile());
			br_list = new BufferedReader(new FileReader(textList));
			bw = new BufferedWriter(fw);
			String Name = "";
			int Season = 2011;
			while ((Name = br_list.readLine()) != null) {
				String csvFile = "/Users/jinyongshin/Desktop/Database_Final/AllLeagues/" + Name;
				br = new BufferedReader(new FileReader(csvFile));
				while ((line = br.readLine()) != null) {
					Scanner kb = new Scanner(line);
					String Rank = kb.next();
					Rank = Rank.substring(0, Rank.length() - 1);
					String Team = kb.next();
					String temp = "";
					while((temp = kb.next()).charAt(0) != '3') {
						Team = Team + " " + temp;
					}
					Team = deAccent(Team);
					String Pld = temp;
					String Win = kb.next();
					String Draw = kb.next();
					String Lost = kb.next();
					String Data = kb.next();
					int index = Data.indexOf(':');
					String GF = Data.substring(0, index);
					String GA = Data.substring(index+1);
					int GDS = Integer.parseInt(GF) - Integer.parseInt(GA);
					String GD = "";
					if (GDS >=0) {
						GD = "+" + GDS;
					} else {
						GD = "" + GDS;
					}
					String Points = kb.next();

					String outputVal = "INSERT INTO League_standing VALUES ('a003', '" + Season + "', '" + Rank + "', \"" + Team + "\", '"
							+ Pld + "', '" + Win + "', '" + Draw + "', '" + Lost + "', '" + GF + "', '" + GA + "', '"
							+ GD + "', '" + Points + "'); \n";
					bw.write(outputVal);
				}
				Season += 1;
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