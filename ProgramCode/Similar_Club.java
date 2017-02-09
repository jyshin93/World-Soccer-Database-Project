package codingChallenge;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.File;
import java.io.IOException;
import java.text.Normalizer;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.regex.Pattern;

public class Similar_Club {

	public static void main(String[] args) {

		// String csvFile =
		// "/Users/jinyongshin/Dropbox/DBFinal/national/list_of_leagues.csv";
		String csvFile = "/Users/jinyongshin/Desktop/Database_Final/Allteams.csv";
		String CSV = "/Users/jinyongshin/Desktop/Database_Final/2002_worldcup_squad.csv";
		BufferedReader br = null;
		BufferedReader b2 = null;
		String line = "";
		String cvsSplitBy = ",";
		// write in file
		BufferedWriter bw = null;
		BufferedWriter bw2 = null;

		try {
			String savedFile = "/Users/jinyongshin/Desktop/Database_Final/Olympic02.sql";
			String savedFile2 = "/Users/jinyongshin/Desktop/Database_Final/RawTeam02.sql";
			File file = new File(savedFile);
			FileWriter fw = new FileWriter(file.getAbsoluteFile());
			File file2 = new File(savedFile2);
			FileWriter fw2 = new FileWriter(file2.getAbsoluteFile());
			bw = new BufferedWriter(fw);
			bw2 = new BufferedWriter(fw2);
			b2 = new BufferedReader(new FileReader(CSV));
			br = new BufferedReader(new FileReader(csvFile));
			HashMap<String, String> set = new HashMap<String, String>();
			while ((line = br.readLine()) != null) {
				String[] data = line.split(cvsSplitBy);
				set.put(data[1], data[0]);
				// bw.write(outputVal);
			}
			HashMap<String, String> raw = new HashMap<String, String>();
			while ((line = b2.readLine()) != null) {
				String[] data = line.split(cvsSplitBy);
				String Year = data[0];
				String Num = data[1];
				String player = deAccent(data[2]);
				String nation = data[3];
				String position = data[4];
//				String height = data[5];
//				String weight = data[6];
//				String date = "";
//				System.out.println(data[7]);
//				if (data[7].length() > 0) {
//					int index1 = data[7].indexOf('-');
//					String dd = data[7].substring(0, index1);
//					if (dd.length() == 1) {
//						dd = "0" + dd;
//					}
//					int index2 = data[7].substring(index1 + 1).indexOf('-');
//					String mm = data[7].substring(index1 + 1, index1 + index2 + 1);
//					if (mm.length() == 1) {
//						mm = "0" + mm;
//					}
//					String yy = data[7].substring(index1 + index2 + 2);
//					date = "19" + yy + "-" + mm + "-" + dd;
//				}
//				String birthPlace = data[8];
				String original = "";
				String team = "";
				if (!data[9].equals(" ")) {
				original = data[9];
				team = deAccent(original);
				HashMap<Double, String> list = new HashMap<Double, String>();
				double score = 0;
				for (String name : set.keySet()) {
					score = similarity(team, name);
					list.put(score, name);
				}
				String TID = "";
				score = Collections.max(list.keySet());
				String temp = "FC " + team;
				if (team.charAt(0) == list.get(score).charAt(0) && score > 0.6 && !team.equals("Atletico Mineiro")) {
					team = list.get(score);
					TID = set.get(team);
				} else if (temp.equals(list.get(score))) {
					team = temp;
					TID = set.get(team);
				} else if (team.equals("QPR")) {
					team = "Queens Park Rangers";
					TID = set.get(team);
				} else if (team.equals("Schalke")) {
					team = "FC Schalke 04";
					TID = set.get(team);
				} else {
					TID = "T000";
				}
				raw.put(TID, original);
				} else {
					team = "No Team";
				}
				String outputVal = "INSERT INTO League_squad VALUES ('" + Year + "', '" + Num + "', \"" + player
						+ "\", '" + nation + "', \"" + position + "\", \"" + team + "\"); \n";
				
				bw.write(outputVal);
				
			}
			for (String key : raw.keySet()) {
				String outputVal2 = "INSERT INTO Club_Original VALUES ('" + key + "', \"" + raw.get(key) + "\"); \n";
				bw2.write(outputVal2);
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
					bw2.close();
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

	public static double similarity(String s1, String s2) {
		String longer = s1, shorter = s2;
		if (s1.length() < s2.length()) { // longer should always have greater
											// length
			longer = s2;
			shorter = s1;
		}
		int longerLength = longer.length();
		if (longerLength == 0) {
			return 1.0;
			/* both strings are zero length */ }
		/*
		 * // If you have StringUtils, you can use it to calculate the edit
		 * distance: return (longerLength -
		 * StringUtils.getLevenshteinDistance(longer, shorter)) / (double)
		 * longerLength;
		 */
		return (longerLength - editDistance(longer, shorter)) / (double) longerLength;

	}

	// Example implementation of the Levenshtein Edit Distance
	// See http://rosettacode.org/wiki/Levenshtein_distance#Java
	public static int editDistance(String s1, String s2) {
		s1 = s1.toLowerCase();
		s2 = s2.toLowerCase();

		int[] costs = new int[s2.length() + 1];
		for (int i = 0; i <= s1.length(); i++) {
			int lastValue = i;
			for (int j = 0; j <= s2.length(); j++) {
				if (i == 0)
					costs[j] = j;
				else {
					if (j > 0) {
						int newValue = costs[j - 1];
						if (s1.charAt(i - 1) != s2.charAt(j - 1))
							newValue = Math.min(Math.min(newValue, lastValue), costs[j]) + 1;
						costs[j - 1] = lastValue;
						lastValue = newValue;
					}
				}
			}
			if (i > 0)
				costs[s2.length()] = lastValue;
		}
		return costs[s2.length()];
	}

}