-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_g8j_rom is 
    generic(
             DWIDTH     : integer := 1; 
             AWIDTH     : integer := 8; 
             MEM_SIZE    : integer := 195
    ); 
    port (
          addr0      : in std_logic_vector(AWIDTH-1 downto 0); 
          ce0       : in std_logic; 
          q0         : out std_logic_vector(DWIDTH-1 downto 0);
          clk       : in std_logic
    ); 
end entity; 


architecture rtl of predict_ensemble_g8j_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 to 8=> "0", 9 to 10=> "1", 11 => "0", 12 to 13=> "1", 14 to 17=> "0", 18 => "1", 19 => "0", 
    20 to 21=> "1", 22 => "0", 23 => "1", 24 => "0", 25 => "1", 26 to 30=> "0", 31 => "1", 
    32 => "0", 33 => "1", 34 => "0", 35 => "1", 36 => "0", 37 => "1", 38 to 39=> "0", 
    40 => "1", 41 => "0", 42 to 44=> "1", 45 to 47=> "0", 48 => "1", 49 => "0", 50 to 51=> "1", 
    52 to 53=> "0", 54 to 55=> "1", 56 => "0", 57 => "1", 58 => "0", 59 => "1", 60 to 62=> "0", 
    63 => "1", 64 => "0", 65 to 70=> "1", 71 => "0", 72 to 73=> "1", 74 => "0", 75 to 77=> "1", 
    78 => "0", 79 to 82=> "1", 83 to 86=> "0", 87 => "1", 88 to 91=> "0", 92 => "1", 93 to 94=> "0", 
    95 => "1", 96 => "0", 97 to 98=> "1", 99 to 100=> "0", 101 to 102=> "1", 103 => "0", 104 => "1", 
    105 => "0", 106 to 108=> "1", 109 to 113=> "0", 114 to 115=> "1", 116 => "0", 117 => "1", 118 => "0", 
    119 => "1", 120 to 122=> "0", 123 => "1", 124 => "0", 125 to 132=> "1", 133 => "0", 134 => "1", 
    135 to 138=> "0", 139 to 140=> "1", 141 to 142=> "0", 143 => "1", 144 => "0", 145 => "1", 146 to 148=> "0", 
    149 to 154=> "1", 155 to 157=> "0", 158 to 162=> "1", 163 to 164=> "0", 165 to 168=> "1", 169 to 170=> "0", 171 to 172=> "1", 
    173 => "0", 174 to 175=> "1", 176 => "0", 177 to 178=> "1", 179 to 194=> "0" );

attribute syn_rom_style : string;
attribute syn_rom_style of mem : signal is "select_rom";
attribute ROM_STYLE : string;
attribute ROM_STYLE of mem : signal is "distributed";

begin 


memory_access_guard_0: process (addr0) 
begin
      addr0_tmp <= addr0;
--synthesis translate_off
      if (CONV_INTEGER(addr0) > mem_size-1) then
           addr0_tmp <= (others => '0');
      else 
           addr0_tmp <= addr0;
      end if;
--synthesis translate_on
end process;

p_rom_access: process (clk)  
begin 
    if (clk'event and clk = '1') then
        if (ce0 = '1') then 
            q0 <= mem(CONV_INTEGER(addr0_tmp)); 
        end if;
    end if;
end process;

end rtl;

Library IEEE;
use IEEE.std_logic_1164.all;

entity predict_ensemble_g8j is
    generic (
        DataWidth : INTEGER := 1;
        AddressRange : INTEGER := 195;
        AddressWidth : INTEGER := 8);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of predict_ensemble_g8j is
    component predict_ensemble_g8j_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_g8j_rom_U :  component predict_ensemble_g8j_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


